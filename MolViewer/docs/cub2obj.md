---
layout: article
title: cub2obj
permalink: /MolViewer/docs/cub2obj
sidebar:
  nav: MolViewer
---

Export 3D models of isosurfaces of gaussian type cube file (.cub) in .obj format.

<!--more-->

Material templates are defined in MolViewer.mtl.
{:.info}

## Syntax

```
cub2obj(cubPath,isovalue)

cub2obj(cubPath,isovalue,'nomolecule')
```

## Description

`cub2obj(cubPath,isovalue)` write isosurfaces of .cub file and molecule defined in the .cub file into .obj file in current folder. The isovalues of isosurfaces are defined by (N-by-1) array `isovalue`.

`cub2obj(cubPath,isovalue,'nomolecule')` will not write molecule in .obj file. 

## Examples

export 3D model of isosurfaces of molecular orbital in [movalue.cub](/MolViewer/assets/movalue.cub).

```matlab
cub2obj('movalue.cub',[0.07;-0.07]);
```

<div>
<img src="/MolViewer/assets/images/movalue_obj.jpg" width="300">
</div>