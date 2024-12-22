---
layout: article
title: lrms
permalink: /MolViewer/docs/lrms
sidebar:
  nav: MolViewer
---

Calculate root-mean-square deviation (RMSD) of two molecules using Kabsch algorithm.

<!--more-->

## Syntax

```
[lrms,R,T]=lrms(P,Q)
```

## Description

`[lrms,R,T]=lrms(P,Q)` calculate RMSD of two molecule coordinates matrices (N-by-3) and return the rotation matrix `R` & translation vector `T`.

## Examples

Calculate RMSD of two molecules with coordinates provided by .xyz files.

```matlab
[~,cr1]=xyz2acr('Mol1.xyz');
[~,cr2]=xyz2acr('Mol2.xyz');
[lrms,~,~]=lrms(cr1,cr2);
```

Find the rotation matrix and translation vector that align two molecules. Then calculate new dipole moment after rotation and translation.

```matlab
[~,R,T]=lrms(cr1,cr2);
new_DP=DP*R+T;
```