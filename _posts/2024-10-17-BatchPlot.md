---
title: 结合Gnuplot与Batch脚本实现快速批量绘图
tags: 
- Code
- Batch
cover: https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/cover/gnuplot.jpg
---
数学绘图软件gnuplot支持从纯文本文件读入坐标信息并使用命令列界面绘制数学函数图形，结合Batch脚本可以实现对具有相似格式的数据文件进行批量作图。
<!--more-->

Batch脚本文件可从[此处](https://cdn.jsdelivr.net/gh/ycythu/assets@main/BatchPlot.zip)下载。

## 使用方法

```bash
BatchPlot.bat file1 file2 file3
```
或者双击运行`BatchPlot.bat`后按提示输入文件路径，有多个文件时使用空格进行分隔。

## 脚本说明

- 脚本会将所有文件中的数据绘制在一个坐标区内，并用不同的颜色进行区分。
- 如果文件中有多于两列的数据，则以第一列数据为横坐标，其他列数据为纵坐标，为每一列数据单独绘制线条。
- 文件中所有以`#`和`@`开头的行将被视为注释，不会用于绘图，而其余行均被视为数据

在使用该脚本时，当关闭绘图窗口后，可选择是否需要对绘图参数（包括坐标轴范围、标题、网格以及导出为文件）进行修改。若批处理全部使用相同的绘图参数，则可以使用下面的简洁版本，使用前按需修改gnuplot命令即可。

```batchfile
@echo off
setlocal EnableDelayedExpansion
echo Input file path (e.g., E:\MD\rdf.xvg), separate multiple files with spaces.
set files=%*
if "%files%"=="" (
    set /p files=
)
set fileNum=0
set plotCmd=

:: 获取文件个数
for %%f in (%files%) do (
    set /a fileNum+=1
)
if %fileNum% lss 1 (
    echo No File Input
    pause
    exit /b
)

for %%f in (%files%) do (
    set columns=0
    set legend=
    set file=%%f
    if not exist !file! (
        echo !file! does not exist
        pause
        exit /b
    )
    set fileName=%%~nf

    :: 生成临时数据文件
    set tmpDataFile=!file:.xvg=!
    type !file! | findstr /v # | findstr /v @ > !tmpDataFile!

    :: 判断数据列数
    for /f "delims=" %%i in ('type !file! ^| find /c "legend """') do set columns=%%i
    set /a columns+=1
    if !columns! lss 2 (
        echo Number of columns less than 2
        pause
        exit /b
    )

    :: 生成绘图命令
    if !columns! equ 2 (
        :: 如果数据列只有两列，图例只需要文件名
        set title=!fileName:_=\_!
        if defined plotCmd (
            set plotCmd=!plotCmd!, '!tmpDataFile!' title '!title!' with lines
        ) else (
            set plotCmd='!tmpDataFile!' title '!title!' with lines
        )
    ) else (
        :: 如果数据列大于两列，图例包含每列的名称
        for /L %%j in (2,1,!columns!) do (
            set /a index=%%j-1
            for /f "delims=" %%i in ('type !file! ^| findstr /r "s!index!"') do set legend=%%i
            set legend='column!index!'
            if !fileNum! gtr 1 (
                :: 如果文件数超过1，图例还需要文件名作为前缀
                set legend=!legend:'=!
                set title='!fileName!_!legend!'
                set title=!title:_=\_!
            ) else (
                set title=!legend!
            )
            if defined plotCmd (
                set plotCmd=!plotCmd!, '!tmpDataFile!' using 1:%%j with lines title !title!
            ) else (
                set plotCmd='!tmpDataFile!' using 1:%%j with lines title !title!
            )
        )
    )
)

gnuplot -p -e "set terminal windows font 'Arial, 18' lw 1.5; set border lw 1.5; plot !plotCmd!"

:: 删除所有临时文件
for %%f in (%files%) do (
    set file=%%f
    set tmpDataFile=!file:.xvg=!
    del /f !tmpDataFile!
)
endlocal
```

此外，用户可在该脚本的基础上通过简单修改使其适应不同专有格式的数据文件。[此处](https://cdn.jsdelivr.net/gh/ycythu/assets@main/BatchPlot.zip)提供了对xmgr格式数据文件进行批量绘图的脚本`BatchPlotXvg.bat`，其可以自动识别文件中的横纵轴标签以及每列数据的标签，可用于GROMACS分析之后的数据快速预览。
