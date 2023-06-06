---
layout: article
title: acr2obj
permalink: /MolViewer/docs/acr2obj
sidebar:
  nav: MolViewer
---

Convert atoms array (N-by-1) and coordinates array (N-by-3) to .obj file use specified style and options. 

<!--more-->

Material templates are defined in MolViewer.mtl.
{:.info}

## Syntax

```
acr2obj(objPath,atoms,coordinates)

acr2obj(objPath,atoms,coordinates,style)

acr2obj(objPath,atoms,coordinates,style,option1,option2,...,optionN)
```

## Description

`acr2obj(objPath,atoms,coordinates)` converts atoms array (N-by-1) and coordinates array (N-by-3) to .obj file in current folder.

`acr2obj(objPath,atoms,coordinates,style,option1,option2,...,optionN)` uses specified style and options to convert files. These parameters' effects are the same as those in [showmol()](/showmol).

## Examples

convert Methane molecule to Methane.obj.

```matlab
atoms=[6;1;1;1;1];
coordinates=[0         , 0         , 0         ;...
             0.62957749, 0.62957749, 0.62957749;...
            -0.62957749,-0.62957749, 0.62957749;...
            -0.62957749, 0.62957749,-0.62957749;...
             0.62957749,-0.62957749,-0.62957749];
acr2obj('Methane.obj',atoms,coordinates);
```