---
title: 基于PyScript的在线分布系数曲线计算器
tags: 
- Chemistry
- Code
- Python
- JavaScript
cover: https://upload.wikimedia.org/wikipedia/commons/1/16/H3PO4_speciation.png
---
<!--more-->

## 分布系数计算器

<link rel="stylesheet" href="https://pyscript.net/latest/pyscript.css" />
<script defer src="https://pyscript.net/latest/pyscript.js"></script>
<style>
  #pKa_table {
    border: 1px solid black;
    border-spacing: 0;
    text-align:center;
    display: table;
  }
  #pKa_table tbody tr:nth-child(odd){
    background-color: #f0f0f0
  }
</style>

Number of dissociable protons:
{:.info}

<input id="n_protic" type="number" min="1" value="2" text-align="center" oninput="set_n_protic()">

Acid dissociation constant table (DO NOT PRESS ENTER):
{:.warning}

<table id="pKa_table">
  <tbody>
    <tr align="center">
      <td>pK<sub>a<sub>1</sub></sub></td>
      <td>pK<sub>a<sub>2</sub></sub></td>
    </tr>
    <tr align="center">
      <td contentEditable="true">6.37</td>
      <td contentEditable="true">10.32</td>
    </tr>
  </tbody>
</table>
<a class="button button--success button--pill" id="Calc" onclick="Calc()">Calculate</a>
<div id="graph_area" align="center"></div>

<py-config>
  packages = ["numpy", "matplotlib"]
</py-config>
<py-script>
  import numpy as np
  import numpy.matlib
  import matplotlib.pyplot as plt
  def ABDC(id_n_protic):
    if ('fig' in globals()):
      plt.clf()
    else:
      ffig,ax=plt.subplots()
    n_protic=Element(id_n_protic)
    pKa=[]
    n=int(n_protic.value)
    from js import pKa_data
    for i in range(n):
      pKa.append(float(pKa_data[i]))
    pKa=np.array(pKa,dtype=np.float32)
    res=100
    pH=np.linspace(0,14,res)
    delta=np.zeros([n+1,res])
    all_form=np.zeros([1,res])
    for i in range(n+1):
      delta[i,:]=10**(-sum(pKa[0:i]))*10**(-(n-i)*pH)
      all_form=all_form+delta[i,:]
    delta=delta/np.matlib.repmat(all_form,n+1,1)
    plt.plot(pH,np.transpose(delta))
    if ('fig' in globals()):
      display(fig,target="graph_area")
    else:
      display(ffig,target="graph_area")
      return ffig
  fig=ABDC("n_protic")
</py-script>

---

## 实现

### Python

```python
import numpy as np
import numpy.matlib
import matplotlib.pyplot as plt

def ABDC(id_n_protic):
  if ('fig' in globals()):
    plt.clf()
  else:
    ffig,ax=plt.subplots()

  n_protic=Element(id_n_protic)
  pKa=[]
  n=int(n_protic.value)

  from js import pKa_data
  for i in range(n):
    pKa.append(float(pKa_data[i]))
  pKa=np.array(pKa,dtype=np.float32)
  
  res=100
  pH=np.linspace(0,14,res)
  delta=np.zeros([n+1,res])
  all_form=np.zeros([1,res])

  for i in range(n+1):
    delta[i,:]=10**(-sum(pKa[0:i]))*10**(-(n-i)*pH)
    all_form=all_form+delta[i,:]

  delta=delta/np.matlib.repmat(all_form,n+1,1)
  plt.plot(pH,np.transpose(delta))
  if ('fig' in globals()):
    display(fig,target="graph_area")
  else:
    display(ffig,target="graph_area")
    return ffig

fig=ABDC("n_protic")
```
### JavaScript

```js
pKa=document.getElementById('pKa_table');
var pKa_data=[]
for(var i=0;i<pKa.rows[0].cells.length;i++){
    pKa_data[i]=pKa.rows[1].cells[i].innerHTML
  }
function set_n_protic(){
  var n_protic=document.getElementById('n_protic').value;
  var columnLength=pKa.rows[0].cells.length;
  if (columnLength<n_protic){
    for (var i=columnLength;i<n_protic;i++){
      var FirstNewCell=pKa.rows[0].insertCell(i);
      var SecondNewCell=pKa.rows[1].insertCell(i);
      FirstNewCell.innerHTML=("pK<sub>a<sub>"+(i+1)+"</sub></sub>");
      SecondNewCell.innerHTML=("14");
      SecondNewCell.contentEditable="true";
    }
  }
  else{
    for (var i=columnLength;i>n_protic;i--){
      pKa.rows[0].deleteCell(i-1);
      pKa.rows[1].deleteCell(i-1);
    }
  }
}
function Calc(){
  var prev_img=document.getElementById("graph_area").getElementsByTagName("div")[0];
  prev_img.remove();
  js_ABDC=pyscript.interpreter.globals.get('ABDC')
  var data=[];
  for(var i=0;i<pKa.rows[0].cells.length;i++){
    data[i]=pKa.rows[1].cells[i].innerHTML
  }
  pKa_data=data;
  console.log(data);
  js_ABDC("n_protic");
}
```

<script>
  pKa=document.getElementById('pKa_table');
  var pKa_data=[]
  for(var i=0;i<pKa.rows[0].cells.length;i++){
      pKa_data[i]=pKa.rows[1].cells[i].innerHTML
    }

  function set_n_protic(){
    var n_protic=document.getElementById('n_protic').value;
    var columnLength=pKa.rows[0].cells.length;
    if (columnLength<n_protic){
      for (var i=columnLength;i<n_protic;i++){
        var FirstNewCell=pKa.rows[0].insertCell(i);
        var SecondNewCell=pKa.rows[1].insertCell(i);
        FirstNewCell.innerHTML=("pK<sub>a<sub>"+(i+1)+"</sub></sub>");
        SecondNewCell.innerHTML=("14");
        SecondNewCell.contentEditable="true";
      }
    }
    else{
      for (var i=columnLength;i>n_protic;i--){
        pKa.rows[0].deleteCell(i-1);
        pKa.rows[1].deleteCell(i-1);
      }
    }
  }

  function Calc(){
    var prev_img=document.getElementById("graph_area").getElementsByTagName("div")[0];
    prev_img.remove();
    js_ABDC=pyscript.interpreter.globals.get('ABDC')
    var data=[];
    for(var i=0;i<pKa.rows[0].cells.length;i++){
      data[i]=pKa.rows[1].cells[i].innerHTML
    }
    pKa_data=data;
    console.log(data);
    js_ABDC("n_protic");
  }
</script>