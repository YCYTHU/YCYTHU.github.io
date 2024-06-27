classdef FluorDecay < handle
    properties
        time (:,1) double {mustBeNonnegative}
        count (:,1) double {mustBeNonnegative}
        irf (:,1) double {mustBeNonnegative}
    end
    properties (SetAccess=private)
        fitParam table
        XData  (:,1) double
        YData (:,1) double
        fitValue (:,1) double
        fitModel string
        fitOption struct = struct('isFix',false(1,9),'fixValue',cell(1),'range',[])
        chiSquare double
        residuals (:,1) double
        autoCorr (:,1) double
        DW double
    end
    properties (Access=private)
        fitFunc function_handle
        fitObject
        gof
        fitOutput
    end
    methods
        function obj = FluorDecay(time, count, irf)
            arguments
                time double {mustBeNonnegative}
                count double {mustBeNonnegative}
                irf double {mustBeNonnegative} = []
            end
            obj.time = time(:);
            obj.count = count(:);
            obj.irf = irf(:);
        end
        function lifeDistrAnalysis(obj, range, nIntervals, type)
            arguments
                obj 
                range (1,2) double
                nIntervals double
                type string
            end
            if nIntervals > 200
                warning("nIntervals > 200")
            end
            if(~exist('type','var'))
                if isempty(obj.irf)
                    type = "tail";
                else
                    type = "reconv";
                end
            end
            obj.fitModel = "Lifetime Distribution Analysis";
            tauArray = [10.^linspace(log10(range(1,1)), log10(range(1,2)), nIntervals),inf];
            sliceData(obj);
            weight = diag(1./sqrt(obj.YData));
            weight(weight==inf) = 1;
            mat = exp(-obj.XData./tauArray);
            % preFactor = (transpose(mat) * weight * mat) \ (transpose(mat) * weight * obj.YData);
            [preFactor,~,residual,exitflag,~] = lsqnonneg(weight * mat,weight * obj.YData);
            if ~any(preFactor)
                error("All pre-Exponential Factors are 0")
            end
            if exitflag == 0
                warning("The number of iterations exceeds the upper limit")
            end
            obj.residuals = residual;
            calcChiSquare(obj, residual, length(obj.XData)-length(preFactor));
            calcDW(obj, residual);
            calcAutoCorr(obj, residual);
            obj.fitValue = mat * preFactor;
            obj.fitParam = table(tauArray(:), preFactor(:),'VariableNames',["tau","B"]);
        end
        function fix(obj, fixNameValue)
            arguments
                obj
                fixNameValue.A double = nan
                fixNameValue.B1 double = nan
                fixNameValue.tau1 double = nan
                fixNameValue.B2 double = nan
                fixNameValue.tau2 double = nan
                fixNameValue.B3 double = nan
                fixNameValue.tau3 double = nan
                fixNameValue.B4 double = nan
                fixNameValue.tau4 double = nan
            end
                fixArray = [fixNameValue.A, ...
                    fixNameValue.B1, fixNameValue.tau1, ...
                    fixNameValue.B2, fixNameValue.tau2, ...
                    fixNameValue.B3, fixNameValue.tau3, ...
                    fixNameValue.B4, fixNameValue.tau4];
                if (any(obj.fitOption.isFix))
                    fixArray(obj.fitOption.isFix) = cell2mat(obj.fitOption.fixValue);
                end
                obj.fitOption.isFix = ~isnan(fixArray);
                obj.fitOption.fixValue = num2cell(fixArray(obj.fitOption.isFix));
        end
        function options(obj, fitOption)
            arguments
                obj 
                fitOption.range (1,2) double
            end
            obj.fitOption.range = fitOption.range;
        end
        function tailFit(obj, guess, varargin)
            arguments
                obj
                guess (1,:) double
            end
            arguments (Repeating)
                varargin
            end
            sliceData(obj);
            expNum = length(guess);
            isFix = obj.fitOption.isFix(1:2*expNum+1);
            obj.fitModel = "Exponential Components Analysis";
            [ft, opt] = setFitType(obj, isFix);
            startPoint = [1, zeros(1, 2*expNum)];
            startPoint(2:2:end) = max(obj.count) / expNum;
            startPoint(3:2:end) = guess;
            opt.StartPoint = startPoint(~isFix);
            if any(isFix)
                [obj.fitObject, obj.gof, obj.fitOutput] = fit(obj.XData, obj.YData, ft, opt, 'problem', obj.fitOption.fixValue);
            else
                [obj.fitObject, obj.gof, obj.fitOutput] = fit(obj.XData, obj.YData, ft, opt);
            end
            disp(obj.fitOutput.message);
            evalQuality(obj);
            param = zeros(1, 2*expNum+1);
            param(isFix) = cell2mat(obj.fitOption.fixValue);
            param(~isFix) = coeffvalues(obj.fitObject);
            obj.fitValue = obj.fitFunc(obj.XData, param);
            obj.residuals = obj.fitOutput.residuals;
            stdDev = nan(1, 2*expNum+1);
            stdDev(~isFix) = sqrt(abs(diag(inv(transpose(obj.fitOutput.Jacobian) * obj.fitOutput.Jacobian)))) * obj.gof.rmse;
            param = num2cell([param(:), stdDev(:)]);
            variableNames = ["A","B1","tau1","B2","tau2","B3","tau3","B4","tau4"];
            obj.fitParam = cell2table(param, ...
                'RowNames',variableNames(1:length(param)), ...
                'VariableNames',["Value","Std. Dev"]);
        end
        function ci = confint(obj, level)
            arguments
                obj 
                level double = 0.95
            end
            ci = confint(obj.fitObject, level);
        end
        function print(obj)
            switch obj.fitModel
                case "Exponential Components Analysis"
                    tau = obj.fitParam.Value(3:2:end);
                    tauDev = obj.fitParam{3:2:end,"Std. Dev"};
                    preFactor = obj.fitParam.Value(2:2:end);
                    preFactorDev = obj.fitParam{2:2:end,"Std. Dev"};
                    intensity = tau .* preFactor;
                    rel = 100 * intensity / sum(intensity);
                    tau_amp = sum(intensity) / sum(preFactor);
                    tau_int = sum(intensity.*tau) / sum(intensity);
                    disp(table(tau(:), tauDev(:), preFactor(:), preFactorDev(:), rel(:), ...
                        'VariableNames',["τ", "τ Std. Dev", "B", "B Std. Dev", "Rel %"]))
                    disp(table(tau_amp, tau_int, obj.chiSquare, obj.DW, obj.fitParam.Value(1), ...
                        'VariableNames', ["τ_amp", "τ_int", "χ^2","Durbin–Watson", "A"]));
                otherwise
                    disp(obj);
            end
        end
        function plot(obj)
            tiledlayout(4,1);
            nexttile([2,1])
            plot(obj.XData,obj.YData,obj.XData,obj.fitValue);
            set(gca,'YScale','log');
            nexttile
            plot(obj.XData,obj.residuals);
            nexttile
            plot(obj.XData,obj.autoCorr);
        end
        function show(obj)
            print(obj);
            plot(obj);
        end
    end
    methods (Access=private)
        function [ft, opt] = setFitType(obj, fix)
            paramName = ["a","b1","t1","b2","t2","b3","t3","b4","t4"];
            paramName = paramName(1:length(fix));
            coeffName = paramName(~fix);
            prblmName = paramName(fix);
            expNum = (length(fix)-1)/2;
            switch expNum
                case 1
                    ft = fittype('a+b1*exp(-x/t1)', ...
                        'coefficients', coeffName, ...
                        'problem', prblmName);
                    obj.fitFunc = @(x, p) p(1)+p(2)*exp(-x/p(3));
                case 2
                    ft = fittype('a+b1*exp(-x/t1)+b2*exp(-x/t2)', ...
                        'coefficients', coeffName, ...
                        'problem', prblmName);
                    obj.fitFunc = @(x, p) p(1)+p(2)*exp(-x/p(3))+p(4)*exp(-x/p(5));
                case 3
                    ft = fittype('a+b1*exp(-x/t1)+b2*exp(-x/t2)+b3*exp(-x/t3)', ...
                        'coefficients', coeffName, ...
                        'problem', prblmName);
                    obj.fitFunc = @(x, p) p(1)+p(2)*exp(-x/p(3))+p(4)*exp(-x/p(5))+p(6)*exp(-x/p(7));
                case 4
                    ft = fittype('a+b1*exp(-x/t1)+b2*exp(-x/t2)+b3*exp(-x/t3)+b4*exp(-x/t4)', ...
                        'coefficients', coeffName, ...
                        'problem', prblmName);
                    obj.fitFunc = @(x, p) p(1)+p(2)*exp(-x/p(3))+p(4)*exp(-x/p(5))+p(6)*exp(-x/p(7))+p(8)*exp(-x/p(9));
                otherwise
                    error("Wrong tail fit type");
            end
            % obj.fitModel = expNum;
            opt = fitoptions(ft);
            opt.Algorithm = 'Levenberg-Marquardt';
            opt.Weights = 1./obj.YData;
            opt.Weights(opt.Weights==inf) = 1;
        end
        function calcChiSquare(obj, wgtRes, df, warn)
            if(~exist('warn','var'))
                warn = 1.3;
            end
            obj.chiSquare = sum(wgtRes.^2)/df;
            if obj.chiSquare > warn
                warning(append("χ^2 > ", num2str(warn)))
            end
        end
        function calcDW(obj, wgtRes, warn)
            if(~exist('warn','var'))
                warn = 1.7;
            end
            obj.DW = sum(diff(wgtRes).^2)/sum(wgtRes.^2);
            if obj.DW < warn
                warning(append("DW parameter < ",num2str(warn)))
            end
        end
        function calcAutoCorr(obj, wgtRes)
            resLen = length(wgtRes);
            %%% MAYBE NEED IMPROVEMENT %%%
            biasRes = zeros(resLen);
            for loop = 0:resLen-1
                biasRes(loop+1,:) = circshift(wgtRes,loop);
            end
            biasRes = triu(biasRes);
            %%% MAYBE NEED IMPROVEMENT %%%
            coeff = resLen./(resLen-(0:resLen-1));
            obj.autoCorr = transpose(coeff) .* (biasRes * wgtRes) ./ sum(wgtRes.^2);
        end
        %% changing
        function evalQuality(obj)
            expNum = (obj.fitOutput.numparam - 1) / 2;
            wgtRes = obj.fitOutput.residuals(:); 
            df = obj.fitOutput.numobs - obj.fitOutput.numparam;
            resLen = length(wgtRes);
            obj.chiSquare = sum(wgtRes.^2)/df;
            if obj.chiSquare > 1.3
                warning("χ^2 > 1.3")
            end
            obj.DW = sum(diff(wgtRes).^2)/sum(wgtRes.^2);
            DWWarn = 1.65 + 0.05 * expNum;
            if obj.DW < DWWarn
                warning(append("DW parameter < ",num2str(DWWarn)))
            end
            %%% MAYBE NEED IMPROVEMENT %%%
            biasRes = zeros(resLen);
            for loop = 0:resLen-1
                biasRes(loop+1,:) = circshift(wgtRes,loop);
            end
            biasRes = triu(biasRes);
            %%% MAYBE NEED IMPROVEMENT %%%
            coeff = resLen./(resLen-(0:resLen-1));
            obj.autoCorr = transpose(coeff) .* (biasRes * wgtRes) ./ sum(wgtRes.^2);
        end
        function sliceData(obj)
            if isempty(obj.fitOption.range)
                [~, obj.fitOption.range(1,1)] = max(obj.count);
                obj.fitOption.range(1,2) = length(obj.count);
            end
            obj.XData = obj.time(obj.fitOption.range(1,1):obj.fitOption.range(1,2));
            obj.XData = obj.XData - obj.XData(1);
            obj.YData = obj.count(obj.fitOption.range(1,1):obj.fitOption.range(1,2));
        end
    end
end