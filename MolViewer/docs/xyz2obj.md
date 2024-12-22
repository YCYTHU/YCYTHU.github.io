---
layout: article
title: xyz2obj
permalink: /MolViewer/docs/xyz2obj
sidebar:
  nav: MolViewer
---

convert .xyz file to .obj file use specified style and options. 

<!--more-->

Material templates are defined in MolViewer.mtl.
{:.info}

## Syntax

```
xyz2obj(xyzPath)

xyz2obj(xyzPath,style)

xyz2obj(xyzPath,style,option1,option2,...,optionN)
```

## Description

`xyz2obj(xyzPath)` converts .xyz file whose file path is `xyzPath` to .obj file in current folder.

`xyz2obj(xyzPath,style,option1,option2,...,optionN)` uses specified style and options to convert files. These parameters' effects are the same as those in [showmol()](/showmol).

## Examples

convert [benzene.xyz](/MolViewer/assets/benzene.xyz) to benzene.obj.

```matlab
xyz2obj('benzene.xyz');
```