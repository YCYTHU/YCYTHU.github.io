---
layout: article
title: xyz2stl
permalink: /MolViewer/docs/xyz2stl
sidebar:
  nav: MolViewer
---

convert .xyz file to .stl file use specified style and options.

<!--more-->

## Syntax

```
xyz2stl(xyzPath)

xyz2stl(xyzPath,style)

xyz2stl(xyzPath,style,option1,option2,...,optionN)
```

## Description

`xyz2stl(xyzPath)` converts .xyz file whose file path is `xyzPath` to .stl file in current folder.

`xyz2stl(xyzPath,style,option1,option2,...,optionN)` uses specified style and options to convert files. These parameters' effects are the same as those in [showmol()](/showmol).

## Examples

convert [benzene.xyz](/MolViewer/assets/benzene.xyz) to benzene.stl.

```matlab
xyz2stl('benzene.xyz');
```