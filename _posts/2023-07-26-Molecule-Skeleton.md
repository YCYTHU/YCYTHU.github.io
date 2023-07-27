---
title: 使用Python绘制分子着色图展示物理量的原子贡献
tags: 
- Chemistry
- Python
cover: 
---
在图像中展现原子电荷分布或原子对某物理量的贡献时如果直接将数值标在原子上面，不仅不直观而且还难以辨认。一种解决办法是通过原子的颜色来表现这些属性的正负和大小。使用VMD观看.pqr文件可以满足此着色要求，但是VMD的自由度较低，不仅着色方案**十分有限**，而且不易以**矢量格式**保存二维的分子骨架示意图。使用Python处理.mol文件并依据原子属性进行着色可以很好地弥补这一缺陷。
<!--more-->

<object data="/assets/images/Caffeine.svg" type="image/svg+xml"></object>

