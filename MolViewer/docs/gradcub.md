---
layout: article
title: gradcub
permalink: /MolViewer/docs/gradcub
sidebar:
  nav: MolViewer
---

return gradient of data in gaussian type cube file (.cub).

<!--more-->

## Syntax

```
[xGradient,yGradient,zGradient]=gradcub(path)

[xGradient,yGradient,zGradient]=gradcub(data)

[xGradient,yGradient,zGradient]=gradcub(...,'normalize')
```
## Description

`[xGradient,yGradient,zGradient]=gradcub(path)` return x, y and z components of gradient vector of .cub file.

`[xGradient,yGradient,zGradient]=gradcub(data)` return x, y and z components of gradient vector of 3d matrix `data`.`xGradient`, `yGradient` and `zGradient` have the same size of `data`.

`[xGradient,yGradient,zGradient]=gradcub(...,'normalize')` return normalized x, y and z components of gradient vector, that is, $$x^2+y^2+z^2=1$$.

## Examples

show gradient arrow of [totesp.cub](/MolViewer/assets/totesp.cub).

```matlab
[xGrid,yGrid,zGrid,data,atoms,coordinates]=cub2mat('totesp.cub');
[xGradient,yGradient,zGradient]=gradcub(data,'normalize');

hold on
quiver3(xGrid,yGrid,zGrid,-xGradient,-yGradient,-zGradient,0.5);
showmol(atoms,coordinates);
hold off

xlim([-1,1])
ylim([-1,1])
zlim([-1,1])
```
<div>
<img src="/MolViewer/assets/images/gradcub.jpg" width="600">
</div>