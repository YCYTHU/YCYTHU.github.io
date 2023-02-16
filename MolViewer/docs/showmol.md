---
layout: article
title: Showmol
permalink: /MolViewer/docs/showmol
sidebar:
  nav: MolViewer
---

show molecule

<!--more-->

## Syntax

showmol(atoms,corrdinates)  

showmol(...,style)  
  
showmol(...,style,option)
  
showmol(ax,...)  
  
[axout,atoms_patch,bonds_patch]=showmol(...)

## Description

`showmol(atoms,corrdinates)` uses array `atoms` (N-by-1) and matrix `coordinates` (N-by-3) to display molecule.  
  
`showmol(...,style)` uses style defined by `style` to display molecule. `style` should be one of 'ball & stick'(default), 'space filling' and 'tube'.  

`showmol(...,style,option)` uses style defined by `style` and options defined by `option` to display molecule. `option` can be chosen from 'normal'(default), 'noh'(do not show hydrogen) and 'labels'(show atoms' labels). If you do not want to specify `style`, you can use `showmol(...,'',option)`.  

`showmol(ax,...)` shows molecule in `ax`.

`[axout,atoms_patch,bonds_patch]=showmol(...)` returns `axout` which molecule are displayed in and two patch structs which contain faces and vertices of atoms' and bonds' surface.  

## Examples