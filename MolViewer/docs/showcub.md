---
layout: article
title: showcub
permalink: /MolViewer/docs/showcub
sidebar:
  nav: MolViewer
---

show isosurface of gaussian type cube file (.cub). and return cell of patches.

<!--more-->

## Syntax

```
cub_patch = showcub(path,isovalue)

cub_patch = showcub(path,isovalue,'nomolecule',options)
```

## Description

`cub_patch = showcub(path,isovalue)` show isosurfaces of .cub file and molecule defined in the .cub file. The isovalues of isosurfaces are defined by (N-by-1) array `isovalue`. `cub_patch` is a cell of patches of isosurfaces.

`cub_patch = showcub(path,isovalue,'nomolecule',options)` do not show molecule and use `option` to draw isosurfaces.

## Examples

show isosurfaces of molecular orbital in [movalue.cub](/MolViewer/assets/movalue.cub).

```matlab
showcub('movalue.cub',[0.07;-0.07]);
```
<div>
<img src="/MolViewer/assets/images/movalue.jpg" width="300">
</div>