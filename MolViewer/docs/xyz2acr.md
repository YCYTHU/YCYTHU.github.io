---
layout: article
title: xyz2acr
permalink: /MolViewer/docs/xyz2acr
sidebar:
  nav: MolViewer
---

convert .xyz file to atoms array (N-by-1) and coordinates matrix (N-by-3).

<!--more-->

## Syntax

```
[atoms,coordinates]=xyz2acr(path)
```

## Description

`[atoms,coordinates]=xyz2acr(path)` use file path of .xyz file as input and output atoms array (N-by-1) and coordinates matrix (N-by-3).

## Examples

convert [benzene.xyz](/MolViewer/assets/benzene.xyz) to atoms (12-by-1) and coordinates (12-by-3) and then display it.  

```matlab
[atoms,coordinates]=xyz2acr('benzene.xyz');
showmol(atoms,coordinates);
```
<div>
<img src="/MolViewer/assets/images/benzene.jpg" width="300">
</div>