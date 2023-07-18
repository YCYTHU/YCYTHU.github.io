function CFSD()

Fig=uifigure('Name','Crystal Field Splitting Diagram', ...
    'Position',[573,444,660,440], ...
    'ReSize','off', ...
    'CloseRequestFcn',@closereq);
movegui(Fig,"center");
layout=uigridlayout(Fig,[10 7]);

Viewer_Axes=uiaxes(layout);
Viewer_Axes.Layout.Row=[1 10];
Viewer_Axes.Layout.Column=[4 6];
set(Viewer_Axes,'DataAspectRatio',[1,1,1], ...
    'PlotBoxAspectRatio',[1,1,1], ...
    'View',[30 30], ...
    'xlim',[-1.2,1.2],'ylim',[-1.2,1.2],'zlim',[-1.2,1.2], ...
    'XTick',[],'YTick',[],'ZTick',[]);
xlabel(Viewer_Axes,'x');
ylabel(Viewer_Axes,'y');
zlabel(Viewer_Axes,'z');

Result_Axes=uiaxes(layout);
Result_Axes.Layout.Row=[1 10];
Result_Axes.Layout.Column=7;
set(Result_Axes,'XTick',[]);
ylabel(Result_Axes,'Energy (Dq)');
yline(Result_Axes,[-4,6],LineWidth=2,Color='r');
ylim(Result_Axes,[-4.8,7.2])

Azimuth=["0";"0";"0";"pi/2";"pi";"3*pi/2"];
Elevation=["0";"pi";"pi/2";"pi/2";"pi/2";"pi/2"];
CN_Table=table(Azimuth,Elevation,'VariableNames',["Azimuth","Polar Angle"]);
Coordinates=uitable(layout);
Coordinates.Layout.Row=[2 9];
Coordinates.Layout.Column=[1 3];
set(Coordinates,'Data',CN_Table, ...
    'ColumnEditable',[true true], ...
    'DisplayDataChangedFcn',@UpdateTable)
showmol(CN_Table);

SetNumber=uispinner(layout);
SetNumber.Layout.Row=1;
SetNumber.Layout.Column=1;
set(SetNumber,'Value',6, ...
    'limit',[1 inf], ...
    'FontName','Cambria', ...
    'Step',1,...
    'ValueDisplayFormat','%.f', ...
    'FontSize',16, ...
    'ValueChangedFcn',@SetNum);

Geo_Select=uidropdown(layout);
Geo_Select.Layout.Row=1;
Geo_Select.Layout.Column=2;
set(Geo_Select,'Items',{'Custom', ...
    'Linear', ...
    'Triangle', ...
    'Square planar', ...
    'Tetrahedron', ...
    'Triangular bipyramid', ...
    'Octahedron', ...
    'Pentagonal bipyramidal', ...
    'Cubic', ...
    'Square antiprism'}, ...
    'Value','Octahedron', ...
    'ValueChangedFcn',@Geo_Change)

Calc_Btn=uibutton(layout);
Calc_Btn.Layout.Row=1;
Calc_Btn.Layout.Column=3;
set(Calc_Btn,'Text','Calculate!', ...
    'BackgroundColor','w', ...
    'FontColor','k',...
    'FontWeight','bold', ...
    'FontName','Cambria', ...
    'FontSize',16, ...
    'ButtonPushedFcn',@Calc)

    function UpdateTable(~,~)
        CN_Table=Coordinates.DisplayData;
        Geo_Select.Value='Custom';
        showmol(CN_Table);
        cla(Result_Axes);
    end

    function SetNum(~,~)
        NewNumber=SetNumber.Value;
        OldNumber=size(CN_Table,1);
        if NewNumber>OldNumber
            Azimuth=repmat("0",NewNumber-OldNumber,1);
            Elevation=repmat("0",NewNumber-OldNumber,1);
            TmpTable=table(Azimuth,Elevation,'VariableNames',["Azimuth","Polar Angle"]);
            CN_Table=[CN_Table;TmpTable];
        else
            CN_Table(NewNumber+1:OldNumber,:)=[];
        end
        set(Coordinates,'Data',CN_Table);
        showmol(CN_Table);
        Geo_Select.Value='Custom';
        cla(Result_Axes);
    end

    function Geo_Change(src,~)
        switch src.Value
            case 'Custom'

            case 'Linear'
                Azimuth=["0";"0"];
                Elevation=["0";"pi"];
                set(SetNumber,'Value',2);
            case 'Triangle'
                Azimuth=["0";"2*pi/3";"4*pi/3"];
                Elevation=["pi/2";"pi/2";"pi/2"];
                set(SetNumber,'Value',3);
            case 'Square planar'
                Azimuth=["0";"pi/2";"pi";"3*pi/2"];
                Elevation=["pi/2";"pi/2";"pi/2";"pi/2"];
                set(SetNumber,'Value',4);
            case 'Tetrahedron'
                Azimuth=["0";"pi";"3*pi/2";"pi/2"];
                Elevation=["acos(sqrt(1/3))";"acos(sqrt(1/3))";"acos(-sqrt(1/3))";"acos(-sqrt(1/3))"];
                set(SetNumber,'Value',4);
            case 'Triangular bipyramid'
                Azimuth=["0";"0";"0";"2*pi/3";"4*pi/3"];
                Elevation=["0";"pi";"pi/2";"pi/2";"pi/2"];
                set(SetNumber,'Value',5);
            case 'Octahedron'
                Azimuth=["0";"0";"0";"pi/2";"pi";"3*pi/2"];
                Elevation=["0";"pi";"pi/2";"pi/2";"pi/2";"pi/2"];
                set(SetNumber,'Value',6);
            case 'Pentagonal bipyramidal'
                Azimuth=["0";"0";"0";"2*pi/5";"4*pi/5";"6*pi/5";"8*pi/5"];
                Elevation=["0";"pi";"pi/2";"pi/2";"pi/2";"pi/2";"pi/2"];
                set(SetNumber,'Value',7);
            case 'Cubic'
                Azimuth=["0";"pi/2";"pi";"3*pi/2";"0";"pi/2";"pi";"3*pi/2"];
                Elevation=["asin(sqrt(2/3))";"asin(sqrt(2/3))";"asin(sqrt(2/3))";"asin(sqrt(2/3))";"pi-asin(sqrt(2/3))";"pi-asin(sqrt(2/3))";"pi-asin(sqrt(2/3))";"pi-asin(sqrt(2/3))"];
                set(SetNumber,'Value',8);
            case 'Square antiprism'
                Azimuth=["0";"pi/2";"pi";"3*pi/2";"pi/4";"3*pi/4";"5*pi/4";"7*pi/4"];
                Elevation=["asin(sqrt(2/3))";"asin(sqrt(2/3))";"asin(sqrt(2/3))";"asin(sqrt(2/3))";"pi-asin(sqrt(2/3))";"pi-asin(sqrt(2/3))";"pi-asin(sqrt(2/3))";"pi-asin(sqrt(2/3))"];
                set(SetNumber,'Value',8);
        end
        CN_Table=table(Azimuth,Elevation,'VariableNames',["Azimuth","Polar Angle"]);
        set(Coordinates,'Data',CN_Table);
        cla(Result_Axes);
        showmol(CN_Table);
    end

    function showmol(CN_Table)
        cla(Viewer_Axes);

        CN_Cell=table2cell(CN_Table);
        CN_Data=cellfun(@(x)str2num(x),CN_Cell);
        [CN_X,CN_Y,CN_Z]=sph2cart(CN_Data(:,1),pi/2-CN_Data(:,2),1);
        CN=[0,0,0;CN_X,CN_Y,CN_Z];

        atom_number=1+size(CN_Data,1);
        atoms=[2;ones(size(CN_Data,1),1)];
        pair_list=nchoosek(1:atom_number,2);
        distance_list=ones(atom_number-1,1);
        bond_list=pair_list(1:atom_number-1,:);

        [xStdSph,yStdSph,zStdSph]=sphere(100);
        [zStdCdr,yStdCdr,xStdCdr]=cylinder(0.02,20);

        atoms_color={'#CCCCCC';'#FF7A60'};
        atoms_radius=[0.1;0.2];

        hold(Viewer_Axes,"on");
        for i = 1:atom_number
            atom = atoms(i);
            x = CN(i,1);
            y = CN(i,2);
            z = CN(i,3);
            xSphere = xStdSph*atoms_radius(atom) + x;
            ySphere = yStdSph*atoms_radius(atom) + y;
            zSphere = zStdSph*atoms_radius(atom) + z;
            atom_sphere = surf(Viewer_Axes,xSphere, ySphere, zSphere);
            set(atom_sphere,'FaceColor',atoms_color{atom},'EdgeColor','none','FaceLighting','gouraud');
        end

        for j = 1:size(bond_list,1)
            bond_vec1=CN(bond_list(j,1),:);
            bond_vec2=CN(bond_list(j,2),:);

            direction=(bond_vec2-bond_vec1)/distance_list(j);
            phi=atan2d(direction(2),direction(1))*(pi/180);
            theta=-asind(direction(3))*(pi/180);

            xCylinder=distance_list(j)*xStdCdr;
            rotz=[cos(phi),-sin(phi),0;sin(phi),cos(phi),0;0,0,1];
            roty=[cos(theta),0,sin(theta);0,1,0;-sin(theta),0,cos(theta)];
            yCylinder=zeros(size(yStdCdr));
            zCylinder=zeros(size(zStdCdr));
            for k=1:2
                rot_cylinder=rotz*roty*[xCylinder(k,:);yStdCdr(k,:);zStdCdr(k,:)];
                xCylinder(k,:)=rot_cylinder(1,:);
                yCylinder(k,:)=rot_cylinder(2,:);
                zCylinder(k,:)=rot_cylinder(3,:);
            end

            bond_cylinder=surf(Viewer_Axes,xCylinder+bond_vec1(1),yCylinder+bond_vec1(2),zCylinder+bond_vec1(3));
            set(bond_cylinder,'EdgeColor','none','FaceColor','#EEE9E9','FaceLighting','gouraud');
        end

        camlight(Viewer_Axes);
        hold(Viewer_Axes,"off");
    end

    function New_CN_Data=Rot_CN(CN_Data)
        [X,Y,Z]=sph2cart(CN_Data(:,1),pi/2-CN_Data(:,2),1);
        Ixx=sum(Y.^2+Z.^2);
        Iyy=sum(X.^2+Z.^2);
        Izz=sum(X.^2+Y.^2);
        Ixy=-sum(X.*Y);
        Ixz=-sum(X.*Z);
        Iyz=-sum(Y.*Z);
        I=[Ixx,Ixy,Ixz;Ixy,Iyy,Iyz;Ixz,Iyz,Izz];

        if isdiag(double(I))
            New_CN_Data=CN_Data;
            return
        else
            [Axis,~]=eig(I);
            % new_z=Axis(:,1)./norm(Axis(:,1));
            % u=cross([0;0;1],new_z);
            % u=u./norm(u);
            % ct=dot([0;0;1],new_z);
            % st=sqrt(1-ct^2);
            % R=[ct+u(1)^2*(1-ct),u(1)*u(2)*(1-ct)-u(3)*st,u(1)*u(3)*(1-ct)+u(2)*st;
            %    u(1)*u(2)*(1-ct)+u(3)*st,ct+u(2)^2*(1-ct),u(2)*u(3)*(1-ct)-u(1)*st;
            %    u(1)*u(3)*(1-ct)-u(2)*st,u(2)*u(3)*(1-ct)+u(1)*st,ct+u(3)^2*(1-ct)];

            R=fliplr(Axis);
            New_Cart=R\[X';Y';Z'];
            [Azimuth,Elevation]=cart2sph(New_Cart(1,:),New_Cart(2,:),New_Cart(3,:));
            Azimuth=transpose(Azimuth);
            Elevation=pi/2-transpose(Elevation);
            New_CN_Data=[Azimuth,Elevation];
            CN_Table=table(string(num2str(double(Azimuth))),string(num2str(double(Elevation))),'VariableNames',["Azimuth","Polar Angle"]);
            set(Coordinates,'Data',CN_Table);
            showmol(CN_Table);
            disp('当前坐标系取向不合适，已自动旋转配体位置，请查看3D查看器。');
        end
    end

    function Calc(~,~)
        cla(Result_Axes);

        Wait = waitbar(0,'Please wait...');
        CN_Cell=table2cell(CN_Table);
        CN_Data=cellfun(@(x)str2sym(x),CN_Cell);
        CN_Data=Rot_CN(CN_Data);
        Phi=transpose(CN_Data(:,1));
        Theta=transpose(CN_Data(:,2));

        b=[12;1];
        c=[6;1];

        D_00_m=zeros(2,size(CN_Data,1));
        D_20_m=b*(3*cos(Theta).^2-1);
        D_40_m=c*((35*cos(Theta).^4)/3-10*cos(Theta).^2+1);
        D_21_m=b*sin(Theta).*cos(Theta).*cos(Phi);
        D_22_m=b*sin(Theta).*cos(2*Phi);
        D_41_m=c*sin(Theta).*cos(Theta).*((7*cos(Theta).^2)/3-1).*cos(Phi);
        D_42_m=c*sin(Theta).^2.*(7*cos(Theta).^2-1).*cos(2*Phi);
        D_43_m=c*sin(Theta).^3.*cos(Theta).*cos(3*Phi);
        D_44_m=c*sin(Theta).^4.*cos(4*Phi);
        G_21_m=b*sin(Theta).*cos(Theta).*sin(2*Phi);
        G_22_m=b*sin(Theta).^2.*sin(2*Phi);
        G_41_m=c*sin(Theta).*cos(Theta).*((7*cos(Theta).^2)/3-1).*sin(Phi);
        G_42_m=c*sin(Theta).^2.*(7*cos(Theta).^2-1).*sin(2*Phi);
        G_43_m=c*sin(Theta).^3.*cos(Theta).*sin(3*Phi);
        G_44_m=c*sin(Theta).^4.*sin(4*Phi);
        waitbar(.2,Wait,'Loading your data...');

        D_00=sum(D_00_m,2);
        D_20=sum(D_20_m,2);
        D_40=sum(D_40_m,2);
        D_21=sum(D_21_m,2);
        D_22=sum(D_22_m,2);
        D_41=sum(D_41_m,2);
        D_42=sum(D_42_m,2);
        D_43=sum(D_43_m,2);
        D_44=sum(D_44_m,2);
        G_21=sum(G_21_m,2);
        G_22=sum(G_22_m,2);
        G_41=sum(G_41_m,2);
        G_42=sum(G_42_m,2);
        G_43=sum(G_43_m,2);
        G_44=sum(G_44_m,2);

        H_11=D_00-D_20/7+D_40/56+5*D_44/24;
        H_12=3*D_21/7-5*D_41/28+5*D_43/12;
        H_13=-(sqrt(sym(3))/7)*D_22+(5*sqrt(sym(3))/84)*D_42;
        H_14=-3*G_21/7+5*G_41/28+5*G_43/12;
        H_15=5*G_44/24;
        H_22=D_00+D_20/14-D_40/14+3*D_22/14+5*D_42/42;
        H_23=(sqrt(sym(3))/7)*D_21+(5*sqrt(sym(3))/14)*D_41;
        H_24=3*G_22/14+5*G_42/42;
        H_25=3*G_21/7-5*G_41/28+5*G_43/12;
        H_33=D_00+D_20/7+3*D_40/28;
        H_34=(sqrt(sym(3))/7)*G_21+(5*sqrt(sym(3))/14)*G_41;
        H_35=-(sqrt(sym(3))/7)*G_22+(5*sqrt(sym(3))/84)*G_42;
        H_44=D_00+D_20/14-D_40/14-3*D_22/14-5*D_42/42;
        H_45=3*D_21/7-5*D_41/28-5*D_43/12;
        H_55=D_00-D_20/7+D_40/56-5*D_44/24;

        Hamilton=cat(3,[H_11(1) H_12(1) H_13(1) H_14(1) H_15(1);
            H_12(1) H_22(1) H_23(1) H_24(1) H_25(1);
            H_13(1) H_23(1) H_33(1) H_34(1) H_35(1);
            H_14(1) H_24(1) H_34(1) H_44(1) H_45(1);
            H_15(1) H_25(1) H_35(1) H_45(1) H_55(1)], ...
            [H_11(2) H_12(2) H_13(2) H_14(2) H_15(2);
            H_12(2) H_22(2) H_23(2) H_24(2) H_25(2);
            H_13(2) H_23(2) H_33(2) H_34(2) H_35(2);
            H_14(2) H_24(2) H_34(2) H_44(2) H_45(2);
            H_15(2) H_25(2) H_35(2) H_45(2) H_55(2)]);

        waitbar(.5,Wait,'Calculating energy...');
        [Orbital,Energy_redun1]=eig(double(Hamilton(:,:,1)));
        Orbital=Orbital./sqrt(sum(Orbital.^2));

        Energy_redun1=diag(Energy_redun1);
        [~,Energy_redun2]=eig(double(Hamilton(:,:,2)));
        Energy_redun2=diag(Energy_redun2);
        Energy_redun=double([Energy_redun1,Energy_redun2]);
        Coefficient=real(Energy_redun)*[1/6 -1/6;-1 2];
        Coefficient(abs(Coefficient)<1e-15)=0;
        Energy=strtrim(rats(real(Energy_redun(:,1))));
        waitbar(.9,Wait,'Processing the result...');

        alpha0=num2str(size(CN_Data,1)*ones(5,1));
        alpha2=strtrim(rats(Coefficient(:,1)));
        alpha4=strtrim(rats(Coefficient(:,2)));
        Results=table(Energy,alpha0,alpha2,alpha4);

        close(Wait);

        yline(Result_Axes,real(Energy_redun(:,1)),LineWidth=2,Color='r');
        ylim(Result_Axes,[1.2*min(real(Energy_redun(:,1))),1.2*max(real(Energy_redun(:,1)))]);

        % Result_Fig=uifigure('Name','Result', ...
        %     'Position',[600,450,600,200], ...
        %     'ReSize','off', ...
        %     'WindowStyle','modal');
        % Result_layout=uigridlayout(Result_Fig,[1 16]);
        % Result_table=uitable(Result_layout);
        % Result_table.Layout.Row=1;
        % Result_table.Layout.Column=[8 16];
        % set(Result_table,'Data',Results, ...
        %     'ColumnEditable',[false false false false]);
        % 
        % [Orbital_row,Orbital_col]=find(Orbital'~=0);
        % Orbital_table=table(Orbital(1,:)', ...
        %     Orbital(2,:)', ...
        %     Orbital(3,:)', ...
        %     Orbital(4,:)', ...
        %     Orbital(5,:)', ...
        %     'VariableNames',["x²-y²","xz","z²","yz","xy"]);
        % Orbital_info=uitable(Result_layout);
        % Orbital_info.Layout.Row=1;
        % Orbital_info.Layout.Column=[1 7];
        % set(Orbital_info,'Data',Orbital_table, ...
        %     'ColumnEditable',[false false false false false], ...
        %     'ColumnWidth','1x');
        % addStyle(Orbital_info, ...
        %     uistyle('BackgroundColor',[1 0.6 0.6]), ...
        %     'cell',[Orbital_row,Orbital_col]);
        % 
        % disp(Orbital);
        % disp(eig(Orbital));
        % movegui(Result_Fig,"center");

        disp(CN_Table);
        disp(Results);
        if any(sum(Orbital)~=ones(1,5))
            warndlg('坐标系取向仍不合适。建议依照配位环境的对称性手动旋转配体位置。','Warning');
            disp(Orbital);
        end

        disp('    ____________________________________');
    end

end

function closereq(src,~)
selection = uiconfirm(src,'Close the figure?','Confirmation');
switch selection
    case 'OK'
        delete(src)
    case 'Cancel'
        return
end
end