---
title: 分布系数计算器
tags: Chemistry
cover: https://upload.wikimedia.org/wikipedia/commons/1/16/H3PO4_speciation.png
---
<!--more-->

---

<link rel="stylesheet" href="https://pyscript.net/latest/pyscript.css" />
<script defer src="https://pyscript.net/latest/pyscript.js"></script>

Number of dissociable protons:

<input id="n_protic" type="number" min="1" value="2" oninput="set_n_protic()">

Acid dissociation constant:

<table id="pKa_table">
  <tbody>
    <tr>
      <td>pK<sub>a<sub>1</sub></sub></td>
      <td contentEditable="true">6.37</td>
    </tr>
    <tr>
      <td>pK<sub>a<sub>2</sub></sub></td>
      <td contentEditable="true">10.32</td>
    </tr>
  </tbody>
</table>

Click button to calculate:

<button id="Calc" onclick="Calc()">Calculate!</button>

<div id="graph_area"></div>

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

<script>
  pKa=document.getElementById('pKa_table');
  var pKa_data=[]
  for(var i=0;i<pKa.rows.length;i++){
      pKa_data[i]=pKa.rows[i].cells[1].innerHTML
    }

  function set_n_protic(){
    var n_protic=document.getElementById('n_protic').value;
    var rowLength=pKa.rows.length;
    if (rowLength<n_protic){
      var NewRow=pKa.insertRow(rowLength);
      NewRow.innerHTML=("<tr><td>pK<sub>a<sub>"+n_protic.toString()+"</sub></sub></td><td contentEditable=\"true\">14</td></tr>");
    }
    else{
      pKa.deleteRow(rowLength-1);
    }
    
  }

  function Calc(){
    var prev_img=document.getElementById("graph_area").getElementsByTagName("div")[0];
    prev_img.remove();
    js_ABDC=pyscript.interpreter.globals.get('ABDC')
    var data=[];
    for(var i=0;i<pKa.rows.length;i++){
      data[i]=pKa.rows[i].cells[1].innerHTML
    }
    pKa_data=data;
    console.log(data);
    js_ABDC("n_protic");
  }
</script>