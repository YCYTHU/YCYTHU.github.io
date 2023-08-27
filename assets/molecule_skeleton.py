# -*- coding: utf-8 -*-
"""
Created on Thu Jul 27 15:03:13 2023

@author: Yaocy
"""

import numpy as np
import matplotlib.pyplot as plt

def mol2graph(mol_path):
    mol_file=open(mol_path)
    mol_data=mol_file.readlines()
    atoms_number=int(mol_data[5].split()[3])
    bonds_number=int(mol_data[5].split()[4])
    coordinates=[]
    bond_matrix=np.zeros([atoms_number,atoms_number])
    
    for i in range(atoms_number):
        coordinates.append(mol_data[i+7].split()[4:6])
        
    for i in range(bonds_number):
        bond_pair=mol_data[i+atoms_number+9].split()[4:6]
        bond_matrix[int(bond_pair[0])-1,int(bond_pair[1])-1]=1
        bond_matrix[int(bond_pair[1])-1,int(bond_pair[0])-1]=1
    
    coordinates=np.array(coordinates,dtype=np.float32)
    mol_file.close()
    
    return coordinates,bond_matrix

def graph2coords(XYCoords,A):
    [i,j]=np.nonzero(A)
    p=np.argsort(np.maximum(i,j))
    i=i[p]
    j=j[p]
    
    X=np.array([XYCoords[i,0],XYCoords[j,0]])
    Y=np.array([XYCoords[i,1],XYCoords[j,1]])
    X=np.vstack((X,np.full((1,len(i)),np.nan)))
    Y=np.vstack((Y,np.full((1,len(i)),np.nan)))
    X=X.T.flatten()
    Y=Y.T.flatten()
    
    return X,Y
    
def drawmol2D(mol_path,colormap,array,scale,**sctr_kwargs):
    coordinates,bond_matrix=mol2graph(mol_path)
    x,y=graph2coords(coordinates,bond_matrix)
    fig,ax=plt.subplots()
    ax.set_aspect(1)
    ax.set_axis_off()
    
    if scale:
        size=abs(scale*array)
    else:
        size=1000
    
    ax.plot(x,y,color='k',linestyle='-',linewidth=8.0,zorder=1)
    plt.scatter(coordinates[:,0],coordinates[:,1],s=size,c=array,marker='o',cmap=colormap,linewidths=5.0,edgecolors='k',zorder=2,**sctr_kwargs)     

    ax.set_xlim((min(coordinates[:,0])-1,max(coordinates[:,0])+1))
    ax.set_ylim((min(coordinates[:,1])-1,max(coordinates[:,1])+1))

def main():
    mol_path="molecule.mol"
    chg_path="chg.txt"
    chg_file=open(chg_path)
    chg=chg_file.readlines()
    chg_file.close()
    chg=np.array([float(x) for x in chg])
    drawmol2D(mol_path,"YlOrBr",chg,15000)

if __name__=='__main__':
    main()