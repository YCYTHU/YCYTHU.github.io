---
title: 使用Python绘制由实心圆构成的矢量图
tags: 
- Code
- Python
cover: https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/dots image/cover.jpg
---
通过在指定的格点处对图片进行采样，可以实现由大小、颜色不同的实心圆来模拟图像，如下图1所示。这一过程可以借助于Python实现，而且由于输出图片仅由填充圆形构成，因此可轻松制作矢量图片（如.svg格式）。
<!--more-->

<table style="width: 75%;margin: 0 auto;">
	<tr>
		<td style="text-align: center; border:none; width: 45%;"><img src="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/dots image/example.jpg" style="vertical-align:baseline;" alt="输入图像（位图）"></td>
		<td style="text-align: center; border:none; width: 45%;"><object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/dots image/example.svg" type="image/svg+xml"></object></td>
	</tr>
</table>
<div align=center><font color="#999999">图1：输入图像（左，位图）与输出图像（右，矢量图）</font></div>

在输出图片中，圆点的半径取决于此点的灰度值，深色位置的圆点半径大而浅色位置的圆点半径小。因此当采样足够密集时灰度接近于连续图像。本程序中所使用的灰度计算公式如下。

$$GRAY=0.299*R+0.587*G+0.114*B$$

## 使用说明

程序主函数`DotsImg`接受4个参数：

- 第一个参数`path`为原图片的路径
- 第二个参数`width`为新生成图片中x方向圆点的数量（默认为256，y方向数量依据原图片宽高比与格点样式自动设置）
- 第三个参数`color`为圆点的颜色，当`color`设置为**HEX（十六进制）格式**的颜色时，程序使用该颜色填充输出的图片中的圆点；当`color`被设置为`'rgb'`时，输出图片中圆点的颜色由原图片该位置对应的颜色所决定
- 第四个参数`grid`设置格点的样式，当`grid`设置为`square`时，按正方形样式确定格点位置（图2左）；当`grid`设置为`hexagonal`时，按正六边形确定格点位置（图2右）

<div style="display:flex; justify-content:space-evenly;">
    <object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/dots image/square.svg" type="image/svg+xml" width="30%"></object>
    <object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/dots image/hexagonal.svg" type="image/svg+xml" width="30%"></object>
</div>
<div align=center><font color="#999999">图2：正方形格点样式（左）与六边形格点样式（右）</font></div>

## 示例

图3展示了`color`设置为`'rgb'`（左）与单一颜色值（右，本例中为`'#222222'`）的区别，其中图片宽度被设置为`256`。

<div align="center">
    <object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/dots image/Img_rgb.svg" type="image/svg+xml" width="45%"></object>
    <object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/dots image/Img_gray.svg" type="image/svg+xml" width="45%"></object>
</div>
<div align=center><font color="#999999">图3：彩色图（左）与单色图（右）</font></div>

图4展示了`grid`设置为`square`（左）与`hexagonal`（右）的区别，其中图片宽度被设置为`128`。

<div align="center">
    <object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/dots image/Img_square.svg" type="image/svg+xml" width="45%"></object>
    <object data="https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/dots image/Img_hexagonal.svg" type="image/svg+xml" width="45%"></object>
</div>
<div align=center><font color="#999999">图4：正方形格点图片（左）与六边形采样格点图片（右）</font></div>

## 实现

**程序设计思路如下：**

- 主函数`DotsImg`首先调用`openimg`函数，接受文件路径与图片宽度为参数，返回`Array of uint8`矩阵，矩阵的列数为指定宽度，行数依据输入图片的宽高比自动设置。随后将RGB矩阵归一化到 $[0\sim1]$ 范围内
- 利用`gengrid`函数依据格点样式产生格点坐标并调用`grid2color`函数根据图片与格点坐标确定每个格点的RGB颜色。
- 随后调用`rgb2gray`和`gray2radius`函数决定每个格点处圆点的半径，圆点的半径取决于此点的灰度值。若原图片还包含透明度数据，则将其存储在向量`alpha`中。
如果`color`被设置为`'rgb'`，则调用`rgb2hex`函数将每个格点处的RGB颜色转换为HEX格式颜色，若`color`被设置为单一颜色，则为每个格点使用相同的颜色进行填充。
- 最后依据圆心位置、半径与颜色为svg添加circle元素并写入文件。如果原图片包含透明度数据，则alpha通道的值以`fill-opacity`属性写入输出文件中。

⚠ png图片中完全透明的部分不会写入到输出文件中；完全不透明的部分不会添加`fill-opacity`属性。
{:.warning}

**程序的Python实现如下：**

```python
from PIL import Image
import numpy as np
```

```python
def DotsImg(path,width=256,color='rgb',grid='square'):
    img=openimg(path,width)
    if np.any(img>1):
        img=img/255

    x,y=gengrid(grid,img.shape[1],img.shape[0])
    
    color_list=grid2color(img,x,y)
    if color_list.shape[1]>3:
        alpha=color_list[:,3]
    grayimg=rgb2gray(color_list)
    radius=gray2radius(grayimg)
    if color=='rgb':
        color_list=rgb2hex((255*color_list).astype('int'))
    else:
        color_list=[color for i in range(len(radius))]
   
    head=['<svg viewBox="0 0 '+str(round(2*max(x)+2,2))+' '+str(round(2*max(y)+2,2))+'" xmlns="http://www.w3.org/2000/svg">\n']
    bottom=['</svg>']
    data_list=[]
    if img.shape[2]>3:
        for i in range(len(radius)):
            if round(alpha[i],2)>0.0 and round(alpha[i],2)<1.0:
                data='  <circle cx="'+str(round(2*x[i]+1,2))+'" cy="'+str(round(2*y[i]+1,2))+'" r="'+str(round(radius[i],2))+'" fill="'+color_list[i]+'" fill-opacity="'+str(round(alpha[i],2))+'"/>\n'      
                data_list.append(data)
            elif round(alpha[i],2)==1.0:
                data='  <circle cx="'+str(round(2*x[i]+1,2))+'" cy="'+str(round(2*y[i]+1,2))+'" r="'+str(round(radius[i],2))+'" fill="'+color_list[i]+'"/>\n'      
                data_list.append(data)
    else:
        for i in range(len(radius)):
            data='  <circle cx="'+str(round(2*x[i]+1,2))+'" cy="'+str(round(2*y[i]+1,2))+'" r="'+str(round(radius[i],2))+'" fill="'+color_list[i]+'" />\n'      
            data_list.append(data)
    
    svg_data=head+data_list+bottom
    svg_file=open("Img.svg","w")
    svg_file.writelines(svg_data)
    svg_file.close()

def openimg(path,width):
    img=Image.open(path)
    height=int(img.size[1]*width/img.size[0])
    img=img.resize((width, height))
    img=np.array(img)
    return img

def gengrid(style,width,height):
    if style=='square':
        x,y=np.meshgrid(np.arange(width),np.arange(height))
    elif style=='hexagonal':
        ratio=np.sqrt(3)/2
        x,y=np.meshgrid(np.arange(width),np.arange(int(height/ratio)))
        y=y*ratio
        x=x.astype('float')
        x[1::2,:]+=0.5
    else:
        x,y=np.meshgrid(np.arange(width),np.arange(height))
    
    x=x.flatten()
    y=y.flatten()
    return x,y

def grid2color(img,x,y):
    img_height=img.shape[0]-1
    img_width=img.shape[1]-1
    rela_x=np.floor((x-min(x))/(max(x)-min(x))*img_width)
    rela_y=np.floor((y-min(y))/(max(y)-min(y))*img_height)
    return img[rela_y.astype('int'),rela_x.astype('int'),:]

def rgb2gray(rgb):
    gray=0.299*rgb[:,0]+0.587*rgb[:,1]+0.114*rgb[:,2]
    return gray

def gray2radius(gray):
    radius=np.power(1-gray,0.3)
    return radius

def rgb2hex(rgb):
    exchange_list=['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F']
    hex_list=[]
    for i in range(len(rgb)):
        hex_string=['#']
        for j in range(3):
            temp_num=rgb[i,j]
            hex_string.append(exchange_list[int(temp_num/16)])
            hex_string.append(exchange_list[temp_num%16])
        hex_list.append(''.join(hex_string))
    return hex_list
```
