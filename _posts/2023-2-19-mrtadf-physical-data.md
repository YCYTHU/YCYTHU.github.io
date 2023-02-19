---
layout: article
title: Physical properties of reported MR-TADF
tags: OLED
cover: /assets/images/20230219.jpg
full_width: true
---

Physical properties of previously reported MR-TADF and those with an MR-TADF acceptor compounds
<!--more-->

<style>
   table {
      font-family: Times New Roman, serif;
      font-size: 16px;
   }
   #text-board {
      display: none;
      font-family: Times New Roman, serif;
      font-size: 12px;
      position: absolute;
      background-color: rgba(63, 63, 63, 0.8);
      border: none;
      padding: 10px;
      z-index: 1;
   }
</style>
<script>
   var textMap = {
    'a': 'a) Photoluminescence emission maxima',
    'b': 'b) Full width half-maxima from the PL spectrum',
    'c': 'c) Absolute photoluminescence quantum yield',
    'd': 'd) Estimated energy level of the S1 state from fluorescence maximum at 77 K',
    'e': 'e) Estimated energy level of the T1 state from phosphorescence maximum at 77 K',
    'f': 'f) Energy difference between singlet and triplet excited states determined from fluorescence and phosphorescence emission maxima at 77 K',
    'g': 'g) Lifetimes calculated from the fluorescence decay',
    'h': 'h) Reverse intersystem crossing decay rate from T1 to S1',
    'i': 'i) Obtained in CH₂Cl₂ solution',
    'j': 'j) Obtained in 1 wt% emitter in PMMA',
    'k': 'k) Obtained in EtOH (saturated)',
    'l': 'l) Obtained in 1 wt% mCBP',
    'm': 'm) Obtained in toluene 10⁻⁵ m',
    'n': 'n) Doped in DPEPO',
    'o': 'o) Obtained in 0.02 × 10⁻³ m in toluene',
    'p': 'p) Obtained in 1 wt% DOBNA-OAr',
    'q': 'q) Obtained in 6 wt% doped in mCPBC',
    'r': 'r) Obtained in 10⁻⁵ m THF',
    's': 's) Obtained in 5 wt% doped in BCPO',
    't': 't) Determined from the Arrhenius plot for kRISC',
    'u': 'u) Obtained in 10⁻⁵ m toluene',
    'v': 'v) Obtained from 20 wt% doped in DBFPO',
    'w': 'w) Obtained in 10 wt% doped in mCP',
    'x': 'x) Obtained in 10 wt% doped in mCP',
    'y': 'y) Obtained in 5 wt% CBP',
    'z': 'z) Obtained in 2 wt% doped in mCP',
    'z1': 'z1) Obtained in 3.5 wt% doped in mCP'
 };
 function showTextBoard(element, text) {
    var textBoard = document.querySelector('#text-board');
    var rect = element.getBoundingClientRect();
    var top = rect.top + rect.height + window.scrollY;
    var left = rect.left + window.scrollX;
    textBoard.style.top = top + 'px';
    textBoard.style.left = left + 'px';
    textBoard.textContent = textMap[text];
    textBoard.style.color = '#ffffff';
    textBoard.style.display = 'block';
 }
 function hideTextBoard() {
    var textBoard = document.querySelector('#text-board');
    textBoard.style.display = 'none';
 }
</script>
<table style="table-layout: fixed; width: 100%;">
   <thead> 
      <tr>

         <th class="bottom-bordered-cell right-bordered-cell left-aligned">Compound</th>
         
         <th class="bottom-bordered-cell center-aligned">λ<sub>PL</sub><br>sol/film [nm]<sup><span onmouseover="showTextBoard(this, 'a')" onmouseout="hideTextBoard()">a)</span></sup></th>
         
         <th class="bottom-bordered-cell center-aligned">FWHM<br>sol/film [nm]<sup><span onmouseover="showTextBoard(this, 'b')" onmouseout="hideTextBoard()">b)</span></sup></th>
         
         <th class="bottom-bordered-cell center-aligned"><i>Φ</i><sub>PL</sub> <br>sol/film [%]<sup><span onmouseover="showTextBoard(this, 'c')" onmouseout="hideTextBoard()">c)</span></sup></th>
         
         <th class="bottom-bordered-cell center-aligned">S1 [eV]<sup><span onmouseover="showTextBoard(this, 'd')" onmouseout="hideTextBoard()">d)</span></sup></th>
         
         <th class="bottom-bordered-cell center-aligned">T1 [eV]<sup><span onmouseover="showTextBoard(this, 'e')" onmouseout="hideTextBoard()">e)</span></sup></th>
         
         <th class="bottom-bordered-cell center-aligned">Δ<i>E</i><sub>ST</sub> [eV]<sup><span onmouseover="showTextBoard(this, 'f')" onmouseout="hideTextBoard()">f)</span></sup></th>
         
         <th class="bottom-bordered-cell center-aligned">τ<sub>d</sub><sup><span onmouseover="showTextBoard(this, 'g')" onmouseout="hideTextBoard()">g)</span></sup> [µs]</th>
         
         <th class="bottom-bordered-cell center-aligned"><i>k</i><sub>RISC</sub><sup><span onmouseover="showTextBoard(this, 'h')" onmouseout="hideTextBoard()">h)</span></sup> [s<sup>−1</sup>]</th>
         
      </tr>
   </thead>
   
   <tbody>

      <tr>

         <td class="right-bordered-cell left-aligned"><a href="https://doi.org/10.1002/anie.201506335"><b>2a</b></a></td>
         
         <td class="center-aligned">398<sup><span onmouseover="showTextBoard(this, 'i')" onmouseout="hideTextBoard()">i)</span></sup>/N/A</td>
         
         <td class="center-aligned">34/–</td>
         
         <td class="center-aligned">–/72<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">3.12<sup><span onmouseover="showTextBoard(this, 'i')" onmouseout="hideTextBoard()">i)</span></sup></td>
         
         <td class="center-aligned">2.97<sup><span onmouseover="showTextBoard(this, 'k')" onmouseout="hideTextBoard()">k)</span></sup></td>
         
         <td class="center-aligned">0.15</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><a href="https://doi.org/10.1002/anie.201506335"><b>2b</b></a></td>
         
         <td class="center-aligned">410<sup><span onmouseover="showTextBoard(this, 'i')" onmouseout="hideTextBoard()">i)</span></sup>/N/A</td>
         
         <td class="center-aligned">28/–</td>
         
         <td class="center-aligned">–/65<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">3.02<sup><span onmouseover="showTextBoard(this, 'i')" onmouseout="hideTextBoard()">i)</span></sup></td>
         
         <td class="center-aligned">2.81<sup><span onmouseover="showTextBoard(this, 'k')" onmouseout="hideTextBoard()">k)</span></sup></td>
         
         <td class="center-aligned">0.21</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><a href="https://doi.org/10.1002/anie.201506335"><b>2c</b></a></td>
         
         <td class="center-aligned">410<sup><span onmouseover="showTextBoard(this, 'i')" onmouseout="hideTextBoard()">i)</span></sup>/N/A</td>
         
         <td class="center-aligned">33/–</td>
         
         <td class="center-aligned">–/60<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">3.02<sup><span onmouseover="showTextBoard(this, 'i')" onmouseout="hideTextBoard()">i)</span></sup></td>
         
         <td class="center-aligned">2.71<sup><span onmouseover="showTextBoard(this, 'k')" onmouseout="hideTextBoard()">k)</span></sup></td>
         
         <td class="center-aligned">0.31</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><a href="https://doi.org/10.1002/anie.201506335"><b>2d</b></a></td>
         
         <td class="center-aligned">436<sup><span onmouseover="showTextBoard(this, 'i')" onmouseout="hideTextBoard()">i)</span></sup>/N/A</td>
         
         <td class="center-aligned">49/–</td>
         
         <td class="center-aligned">–/57<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">2.84<sup><span onmouseover="showTextBoard(this, 'i')" onmouseout="hideTextBoard()">i)</span></sup></td>
         
         <td class="center-aligned">2.70<sup><span onmouseover="showTextBoard(this, 'k')" onmouseout="hideTextBoard()">k)</span></sup></td>
         
         <td class="center-aligned">0.14</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><a href="https://doi.org/10.1002/anie.201506335"><b>2e</b></a></td>
         
         <td class="center-aligned">–/492</td>
         
         <td class="center-aligned">–/96</td>
         
         <td class="center-aligned">–/92<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">2.52<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">2.46<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">0.06</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><a href="https://doi.org/10.1002/adma.201505491"><b>DABNA-1</b></a></td>
         
         <td class="center-aligned">462<sup><span onmouseover="showTextBoard(this, 'l')" onmouseout="hideTextBoard()">l)</span></sup></td>
         
         <td class="center-aligned">33/30</td>
         
         <td class="center-aligned">89<sup><span onmouseover="showTextBoard(this, 'l')" onmouseout="hideTextBoard()">l)</span></sup></td>
         
         <td class="center-aligned">2.67<sup><span onmouseover="showTextBoard(this, 'l')" onmouseout="hideTextBoard()">l)</span></sup></td>
         
         <td class="center-aligned">2.49<sup><span onmouseover="showTextBoard(this, 'l')" onmouseout="hideTextBoard()">l)</span></sup></td>
         
         <td class="center-aligned">0.18</td>
         
         <td class="center-aligned">93.7<sup><span onmouseover="showTextBoard(this, 'l')" onmouseout="hideTextBoard()">l)</span></sup></td>
         
         <td class="center-aligned">9.9 × 10<sup>3</sup><sup><span onmouseover="showTextBoard(this, 'l')" onmouseout="hideTextBoard()">l)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><a href="https://doi.org/10.1002/adma.201505491"><b>DABNA-2</b></a></td>
         
         <td class="center-aligned">470<sup><span onmouseover="showTextBoard(this, 'l')" onmouseout="hideTextBoard()">l)</span></sup></td>
         
         <td class="center-aligned">34/28</td>
         
         <td class="center-aligned">85/90</td>
         
         <td class="center-aligned">2.61<sup><span onmouseover="showTextBoard(this, 'l')" onmouseout="hideTextBoard()">l)</span></sup></td>
         
         <td class="center-aligned">2.47<sup><span onmouseover="showTextBoard(this, 'l')" onmouseout="hideTextBoard()">l)</span></sup></td>
         
         <td class="center-aligned">0.14</td>
         
         <td class="center-aligned">65.3<sup><span onmouseover="showTextBoard(this, 'l')" onmouseout="hideTextBoard()">l)</span></sup></td>
         
         <td class="center-aligned">14.8 × 10<sup>3</sup><sup><span onmouseover="showTextBoard(this, 'l')" onmouseout="hideTextBoard()">l)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>2a</b></td>
         
         <td class="center-aligned">403<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">–/26</td>
         
         <td class="center-aligned">36/54</td>
         
         <td class="center-aligned">3.11<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">2.90<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">0.21</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>1</b></td>
         
         <td class="center-aligned">386/–</td>
         
         <td class="center-aligned">48/–</td>
         
         <td class="center-aligned">63/–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>B2</b></td>
         
         <td class="center-aligned">461<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">39/32</td>
         
         <td class="center-aligned">39/53</td>
         
         <td class="center-aligned">2.73<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">2.54<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">0.19</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>B3</b></td>
         
         <td class="center-aligned">442<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">50/34</td>
         
         <td class="center-aligned">13/34</td>
         
         <td class="center-aligned">2.81<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">2.66<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">0.15</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>B4</b></td>
         
         <td class="center-aligned">449<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">22/38</td>
         
         <td class="center-aligned">21/57</td>
         
         <td class="center-aligned">2.76<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">2.61<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">0.15</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>B2-F</b></td>
         
         <td class="center-aligned">–/467<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">–/44</td>
         
         <td class="center-aligned">–/57</td>
         
         <td class="center-aligned">2.66<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">2.51<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">0.15</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>TBN-TPA</b></td>
         
         <td class="center-aligned">470<sup><span onmouseover="showTextBoard(this, 'm')" onmouseout="hideTextBoard()">m)</span></sup>/–</td>
         
         <td class="center-aligned">26<sup><span onmouseover="showTextBoard(this, 'm')" onmouseout="hideTextBoard()">m)</span></sup>/–</td>
         
         <td class="center-aligned">97<sup><span onmouseover="showTextBoard(this, 'm')" onmouseout="hideTextBoard()">m)</span></sup>/–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">0.14<sup><span onmouseover="showTextBoard(this, 'm')" onmouseout="hideTextBoard()">m)</span></sup></td>
         
         <td class="center-aligned">51.0<sup><span onmouseover="showTextBoard(this, 'm')" onmouseout="hideTextBoard()">m)</span></sup></td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b><i>t</i>-DABNA</b></td>
         
         <td class="center-aligned">/445<sup><span onmouseover="showTextBoard(this, 'n')" onmouseout="hideTextBoard()">n)</span></sup></td>
         
         <td class="center-aligned">–/–</td>
         
         <td class="center-aligned">–/85<sup><span onmouseover="showTextBoard(this, 'n')" onmouseout="hideTextBoard()">n)</span></sup></td>
         
         <td class="center-aligned">2.80<sup><span onmouseover="showTextBoard(this, 'n')" onmouseout="hideTextBoard()">n)</span></sup></td>
         
         <td class="center-aligned">2.63<sup><span onmouseover="showTextBoard(this, 'n')" onmouseout="hideTextBoard()">n)</span></sup></td>
         
         <td class="center-aligned">0.17</td>
         
         <td class="center-aligned">83.3<sup><span onmouseover="showTextBoard(this, 'n')" onmouseout="hideTextBoard()">n)</span></sup></td>
         
         <td class="center-aligned">2.44 × 10<sup>3</sup><sup><span onmouseover="showTextBoard(this, 'n')" onmouseout="hideTextBoard()">n)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>ν-DABNA</b></td>
         
         <td class="center-aligned">468<sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         <td class="center-aligned">14/18</td>
         
         <td class="center-aligned">74/90</td>
         
         <td class="center-aligned">2.64<sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         <td class="center-aligned">2.62<sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         <td class="center-aligned">0.017<sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         <td class="center-aligned">4.1<sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         <td class="center-aligned">2.0 × 10<sup>5</sup><sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>DOBNA-OAr</b></td>
         
         <td class="center-aligned">388<sup><span onmouseover="showTextBoard(this, 'o')" onmouseout="hideTextBoard()">o)</span></sup>/–</td>
         
         <td class="center-aligned">34<sup><span onmouseover="showTextBoard(this, 'o')" onmouseout="hideTextBoard()">o)</span></sup>/–</td>
         
         <td class="center-aligned">65<sup><span onmouseover="showTextBoard(this, 'o')" onmouseout="hideTextBoard()">o)</span></sup>/–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>TCz-BN</b><sup><span onmouseover="showTextBoard(this, 'l')" onmouseout="hideTextBoard()">l)</span></sup></td>
         
         <td class="center-aligned">477<sup><span onmouseover="showTextBoard(this, 'm')" onmouseout="hideTextBoard()">m)</span></sup>/–</td>
         
         <td class="center-aligned">22<sup><span onmouseover="showTextBoard(this, 'm')" onmouseout="hideTextBoard()">m)</span></sup>/–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>2F-BN</b></td>
         
         <td class="center-aligned">494<sup><span onmouseover="showTextBoard(this, 'q')" onmouseout="hideTextBoard()">q)</span></sup></td>
         
         <td class="center-aligned">26/32</td>
         
         <td class="center-aligned">95<sup><span onmouseover="showTextBoard(this, 'q')" onmouseout="hideTextBoard()">q)</span></sup></td>
         
         <td class="center-aligned">2.51<sup><span onmouseover="showTextBoard(this, 'm')" onmouseout="hideTextBoard()">m)</span></sup></td>
         
         <td class="center-aligned">2.35<sup><span onmouseover="showTextBoard(this, 'm')" onmouseout="hideTextBoard()">m)</span></sup></td>
         
         <td class="center-aligned">0.16</td>
         
         <td class="center-aligned">25.9<sup><span onmouseover="showTextBoard(this, 'q')" onmouseout="hideTextBoard()">q)</span></sup></td>
         
         <td class="center-aligned">2.4 × 10<sup>4</sup><sup><span onmouseover="showTextBoard(this, 'q')" onmouseout="hideTextBoard()">q)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>3F-BN</b></td>
         
         <td class="center-aligned">499<sup><span onmouseover="showTextBoard(this, 'q')" onmouseout="hideTextBoard()">q)</span></sup></td>
         
         <td class="center-aligned">27/33</td>
         
         <td class="center-aligned">90<sup><span onmouseover="showTextBoard(this, 'q')" onmouseout="hideTextBoard()">q)</span></sup></td>
         
         <td class="center-aligned">2.48<sup><span onmouseover="showTextBoard(this, 'm')" onmouseout="hideTextBoard()">m)</span></sup></td>
         
         <td class="center-aligned">2.40<sup><span onmouseover="showTextBoard(this, 'm')" onmouseout="hideTextBoard()">m)</span></sup></td>
         
         <td class="center-aligned">0.08</td>
         
         <td class="center-aligned">16.7<sup><span onmouseover="showTextBoard(this, 'q')" onmouseout="hideTextBoard()">q)</span></sup></td>
         
         <td class="center-aligned">3.9 × 10<sup>4</sup><sup><span onmouseover="showTextBoard(this, 'q')" onmouseout="hideTextBoard()">q)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>4F-BN</b></td>
         
         <td class="center-aligned">496<sup><span onmouseover="showTextBoard(this, 'q')" onmouseout="hideTextBoard()">q)</span></sup></td>
         
         <td class="center-aligned">26/31</td>
         
         <td class="center-aligned">99<sup><span onmouseover="showTextBoard(this, 'q')" onmouseout="hideTextBoard()">q)</span></sup></td>
         
         <td class="center-aligned">2.50<sup><span onmouseover="showTextBoard(this, 'm')" onmouseout="hideTextBoard()">m)</span></sup></td>
         
         <td class="center-aligned">2.39<sup><span onmouseover="showTextBoard(this, 'm')" onmouseout="hideTextBoard()">m)</span></sup></td>
         
         <td class="center-aligned">0.11</td>
         
         <td class="center-aligned">19.0<sup><span onmouseover="showTextBoard(this, 'q')" onmouseout="hideTextBoard()">q)</span></sup></td>
         
         <td class="center-aligned">4.4 × 10<sup>4</sup><sup><span onmouseover="showTextBoard(this, 'q')" onmouseout="hideTextBoard()">q)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>α-3BNOH</b></td>
         
         <td class="center-aligned">390<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">31/32</td>
         
         <td class="center-aligned">50/–</td>
         
         <td class="center-aligned">3.12<sup><span onmouseover="showTextBoard(this, 'r')" onmouseout="hideTextBoard()">r)</span></sup></td>
         
         <td class="center-aligned">2.81<sup><span onmouseover="showTextBoard(this, 'r')" onmouseout="hideTextBoard()">r)</span></sup></td>
         
         <td class="center-aligned">0.31</td>
         
         <td class="center-aligned">0.45<sup><span onmouseover="showTextBoard(this, 'r')" onmouseout="hideTextBoard()">r)</span></sup></td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>ADBNA-Me-Mes</b><sup><span onmouseover="showTextBoard(this, 'n')" onmouseout="hideTextBoard()">n)</span></sup></td>
         
         <td class="center-aligned">–/482<sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         <td class="center-aligned">–/33</td>
         
         <td class="center-aligned">–/89</td>
         
         <td class="center-aligned">2.57<sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         <td class="center-aligned">2.39<sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         <td class="center-aligned">0.18</td>
         
         <td class="center-aligned">165.0<sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         <td class="center-aligned">7.6 × 10<sup>3</sup><sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>ADBNA-Me-Tip</b><sup><span onmouseover="showTextBoard(this, 'n')" onmouseout="hideTextBoard()">n)</span></sup></td>
         
         <td class="center-aligned">–/479<sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         <td class="center-aligned">–/34</td>
         
         <td class="center-aligned">–/88</td>
         
         <td class="center-aligned">2.59<sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         <td class="center-aligned">2.41<sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         <td class="center-aligned">0.18</td>
         
         <td class="center-aligned">147.0<sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         <td class="center-aligned">9.0 × 10<sup>3</sup><sup><span onmouseover="showTextBoard(this, 'p')" onmouseout="hideTextBoard()">p)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>3</b><sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">482<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">71/84</td>
         
         <td class="center-aligned">2.56<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">2.38<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">0.18</td>
         
         <td class="center-aligned"></td>
         
         <td class="center-aligned"></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>4a</b><sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">485<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">88/91</td>
         
         <td class="center-aligned">2.54<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">2.35<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">0.19</td>
         
         <td class="center-aligned"></td>
         
         <td class="center-aligned"></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>4b</b><sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">487<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">85/93</td>
         
         <td class="center-aligned">2.53<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">2.34<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">0.19</td>
         
         <td class="center-aligned"></td>
         
         <td class="center-aligned"></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>5a</b><sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">483<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">82/91</td>
         
         <td class="center-aligned">2.56<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">2.38<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">0.18</td>
         
         <td class="center-aligned"></td>
         
         <td class="center-aligned"></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>5b</b><sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">486<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">81/86</td>
         
         <td class="center-aligned">2.55<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">2.38<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">0.17</td>
         
         <td class="center-aligned"></td>
         
         <td class="center-aligned"></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>6a</b><sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">477, 609<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">19/26</td>
         
         <td class="center-aligned">2.55<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">2.38<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">0.17</td>
         
         <td class="center-aligned"></td>
         
         <td class="center-aligned"></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>6b</b><sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">481, 601<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">18/24</td>
         
         <td class="center-aligned">2.51<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">2.38<sup><span onmouseover="showTextBoard(this, 'j')" onmouseout="hideTextBoard()">j)</span></sup></td>
         
         <td class="center-aligned">0.13</td>
         
         <td class="center-aligned"></td>
         
         <td class="center-aligned"></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>m-AC-DBNA</b></td>
         
         <td class="center-aligned">569<sup><span onmouseover="showTextBoard(this, 's')" onmouseout="hideTextBoard()">s)</span></sup></td>
         
         <td class="center-aligned">58/89</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">0.009<sup><span onmouseover="showTextBoard(this, 't')" onmouseout="hideTextBoard()">t)</span></sup></td>
         
         <td class="center-aligned">7.6<sup><span onmouseover="showTextBoard(this, 's')" onmouseout="hideTextBoard()">s)</span></sup></td>
         
         <td class="center-aligned">2.6 × 10<sup>5</sup><sup><span onmouseover="showTextBoard(this, 's')" onmouseout="hideTextBoard()">s)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>p-AC-DBNA</b></td>
         
         <td class="center-aligned">557<sup><span onmouseover="showTextBoard(this, 's')" onmouseout="hideTextBoard()">s)</span></sup></td>
         
         <td class="center-aligned">96/96</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">0.009<sup><span onmouseover="showTextBoard(this, 't')" onmouseout="hideTextBoard()">t)</span></sup></td>
         
         <td class="center-aligned">1.5<sup><span onmouseover="showTextBoard(this, 's')" onmouseout="hideTextBoard()">s)</span></sup></td>
         
         <td class="center-aligned">1.2 × 10<sup>5</sup><sup><span onmouseover="showTextBoard(this, 's')" onmouseout="hideTextBoard()">s)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>m′-AC-DBNA</b></td>
         
         <td class="center-aligned">568<sup><span onmouseover="showTextBoard(this, 's')" onmouseout="hideTextBoard()">s)</span></sup></td>
         
         <td class="center-aligned">51/87</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">0.03<sup><span onmouseover="showTextBoard(this, 't')" onmouseout="hideTextBoard()">t)</span></sup></td>
         
         <td class="center-aligned">7.8<sup><span onmouseover="showTextBoard(this, 's')" onmouseout="hideTextBoard()">s)</span></sup></td>
         
         <td class="center-aligned">8.4 × 10<sup>5</sup><sup><span onmouseover="showTextBoard(this, 's')" onmouseout="hideTextBoard()">s)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>TDBA-Ac</b></td>
         
         <td class="center-aligned">458<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup>/</td>
         
         <td class="center-aligned">50/–</td>
         
         <td class="center-aligned">–/93<sup><span onmouseover="showTextBoard(this, 'v')" onmouseout="hideTextBoard()">v)</span></sup></td>
         
         <td class="center-aligned">3.11<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup></td>
         
         <td class="center-aligned">3.05<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup></td>
         
         <td class="center-aligned">0.06</td>
         
         <td class="center-aligned">1.0<sup><span onmouseover="showTextBoard(this, 'i')" onmouseout="hideTextBoard()">i)</span></sup></td>
         
         <td class="center-aligned">9.9 × 10<sup>5</sup><sup><span onmouseover="showTextBoard(this, 'v')" onmouseout="hideTextBoard()">v)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>TDBA-DI</b></td>
         
         <td class="center-aligned">456<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup>/</td>
         
         <td class="center-aligned">55/–</td>
         
         <td class="center-aligned">–/99<sup><span onmouseover="showTextBoard(this, 'v')" onmouseout="hideTextBoard()">v)</span></sup></td>
         
         <td class="center-aligned">3.06<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup></td>
         
         <td class="center-aligned">2.95<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup></td>
         
         <td class="center-aligned">0.11</td>
         
         <td class="center-aligned">6.2<sup><span onmouseover="showTextBoard(this, 'i')" onmouseout="hideTextBoard()">i)</span></sup></td>
         
         <td class="center-aligned">10.8 × 10<sup>5</sup><sup><span onmouseover="showTextBoard(this, 'v')" onmouseout="hideTextBoard()">v)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>OBA-O</b></td>
         
         <td class="center-aligned">444<sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         <td class="center-aligned">–/80</td>
         
         <td class="center-aligned">76/84</td>
         
         <td class="center-aligned">3.15<sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         <td class="center-aligned">3.06<sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         <td class="center-aligned">0.09</td>
         
         <td class="center-aligned">4.14</td>
         
         <td class="center-aligned">4.3 × 10<sup>5</sup><sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>OBA-S</b></td>
         
         <td class="center-aligned">456<sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         <td class="center-aligned">–/68</td>
         
         <td class="center-aligned">63/75</td>
         
         <td class="center-aligned">3.17<sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         <td class="center-aligned">3.08<sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         <td class="center-aligned">0.09</td>
         
         <td class="center-aligned">4.80</td>
         
         <td class="center-aligned">2.8 × 10<sup>5</sup><sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>OBA-BrO</b></td>
         
         <td class="center-aligned">470<sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         <td class="center-aligned">–/83</td>
         
         <td class="center-aligned">84/92</td>
         
         <td class="center-aligned">3.25<sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         <td class="center-aligned">3.21<sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         <td class="center-aligned">0.04</td>
         
         <td class="center-aligned">3.74</td>
         
         <td class="center-aligned">9.0 × 10<sup>5</sup><sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>OBA-BrS</b></td>
         
         <td class="center-aligned">478<sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         <td class="center-aligned">–/108</td>
         
         <td class="center-aligned">53/55</td>
         
         <td class="center-aligned">3.19<sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         <td class="center-aligned">3.12<sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         <td class="center-aligned">0.07</td>
         
         <td class="center-aligned">0.81</td>
         
         <td class="center-aligned">8.4 × 10<sup>5</sup><sup><span onmouseover="showTextBoard(this, 'w')" onmouseout="hideTextBoard()">w)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>3CzTB</b></td>
         
         <td class="center-aligned">433<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup>/–</td>
         
         <td class="center-aligned">–/49</td>
         
         <td class="center-aligned">–/88<sup><span onmouseover="showTextBoard(this, 'v')" onmouseout="hideTextBoard()">v)</span></sup></td>
         
         <td class="center-aligned">3.16<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup></td>
         
         <td class="center-aligned">2.93<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup></td>
         
         <td class="center-aligned">0.23</td>
         
         <td class="center-aligned">9.32<sup><span onmouseover="showTextBoard(this, 'v')" onmouseout="hideTextBoard()">v)</span></sup></td>
         
         <td class="center-aligned">1.0 × 10<sup>5</sup><sup><span onmouseover="showTextBoard(this, 'v')" onmouseout="hideTextBoard()">v)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>M3CzB</b></td>
         
         <td class="center-aligned">445<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup>/–</td>
         
         <td class="center-aligned">–/42</td>
         
         <td class="center-aligned">–/93<sup><span onmouseover="showTextBoard(this, 'v')" onmouseout="hideTextBoard()">v)</span></sup></td>
         
         <td class="center-aligned">3.06<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup></td>
         
         <td class="center-aligned">2.92<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup></td>
         
         <td class="center-aligned">0.14</td>
         
         <td class="center-aligned">7.84<sup><span onmouseover="showTextBoard(this, 'v')" onmouseout="hideTextBoard()">v)</span></sup></td>
         
         <td class="center-aligned">1.4 × 10<sup>5</sup><sup><span onmouseover="showTextBoard(this, 'v')" onmouseout="hideTextBoard()">v)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>QAO</b></td>
         
         <td class="center-aligned">466<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup>/</td>
         
         <td class="center-aligned">32/–</td>
         
         <td class="center-aligned">–/72<sup><span onmouseover="showTextBoard(this, 'x')" onmouseout="hideTextBoard()">x)</span></sup></td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">0.18<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup></td>
         
         <td class="center-aligned">93.3<sup><span onmouseover="showTextBoard(this, 'x')" onmouseout="hideTextBoard()">x)</span></sup></td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>QAO-DAd</b></td>
         
         <td class="center-aligned">548<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup>/</td>
         
         <td class="center-aligned">49/–</td>
         
         <td class="center-aligned">90<sup><span onmouseover="showTextBoard(this, 'y')" onmouseout="hideTextBoard()">y)</span></sup></td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">–</td>
         
         <td class="center-aligned">0.01<sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup></td>
         
         <td class="center-aligned">7.8<sup><span onmouseover="showTextBoard(this, 'y')" onmouseout="hideTextBoard()">y)</span></sup></td>
         
         <td class="center-aligned">–</td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>3-Ph-QAD</b></td>
         
         <td class="center-aligned">466<sup><span onmouseover="showTextBoard(this, 'z')" onmouseout="hideTextBoard()">z)</span></sup></td>
         
         <td class="center-aligned">30/55</td>
         
         <td class="center-aligned">–/73<sup><span onmouseover="showTextBoard(this, 'z')" onmouseout="hideTextBoard()">z)</span></sup></td>
         
         <td class="center-aligned">2.60<sup><span onmouseover="showTextBoard(this, 'z')" onmouseout="hideTextBoard()">z)</span></sup></td>
         
         <td class="center-aligned">2.42<sup><span onmouseover="showTextBoard(this, 'z')" onmouseout="hideTextBoard()">z)</span></sup></td>
         
         <td class="center-aligned">0.18</td>
         
         <td class="center-aligned">250<sup><span onmouseover="showTextBoard(this, 'z')" onmouseout="hideTextBoard()">z)</span></sup></td>
         
         <td class="center-aligned">1.2 × 10<sup>4</sup><sup><span onmouseover="showTextBoard(this, 'z')" onmouseout="hideTextBoard()">z)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>7-Ph-QAD</b></td>
         
         <td class="center-aligned">464<sup><span onmouseover="showTextBoard(this, 'z')" onmouseout="hideTextBoard()">z)</span></sup></td>
         
         <td class="center-aligned">22/58</td>
         
         <td class="center-aligned">–/68<sup><span onmouseover="showTextBoard(this, 'z')" onmouseout="hideTextBoard()">z)</span></sup></td>
         
         <td class="center-aligned">2.63<sup><span onmouseover="showTextBoard(this, 'z')" onmouseout="hideTextBoard()">z)</span></sup></td>
         
         <td class="center-aligned">2.44<sup><span onmouseover="showTextBoard(this, 'z')" onmouseout="hideTextBoard()">z)</span></sup></td>
         
         <td class="center-aligned">0.19</td>
         
         <td class="center-aligned">474<sup><span onmouseover="showTextBoard(this, 'z')" onmouseout="hideTextBoard()">z)</span></sup></td>
         
         <td class="center-aligned">6.4 × 10<sup>3</sup><sup><span onmouseover="showTextBoard(this, 'z')" onmouseout="hideTextBoard()">z)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>DiKTa</b></td>
         
         <td class="center-aligned">453<sup><span onmouseover="showTextBoard(this, 'z1')" onmouseout="hideTextBoard()">z1)</span></sup></td>
         
         <td class="center-aligned">27/37</td>
         
         <td class="center-aligned">26/75</td>
         
         <td class="center-aligned">2.75<sup><span onmouseover="showTextBoard(this, 'z1')" onmouseout="hideTextBoard()">z1)</span></sup></td>
         
         <td class="center-aligned">2.55<sup><span onmouseover="showTextBoard(this, 'z1')" onmouseout="hideTextBoard()">z1)</span></sup></td>
         
         <td class="center-aligned">0.20</td>
         
         <td class="center-aligned">15<sup><span onmouseover="showTextBoard(this, 'z1')" onmouseout="hideTextBoard()">z1)</span></sup></td>
         
         <td class="center-aligned">4.6 × 10<sup>4</sup><sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup></td>
         
         
      </tr>
      
      <tr>

         <td class="right-bordered-cell left-aligned"><b>Mes<sub>3</sub>DiKTa</b></td>
         
         <td class="center-aligned">468<sup><span onmouseover="showTextBoard(this, 'z1')" onmouseout="hideTextBoard()">z1)</span></sup></td>
         
         <td class="center-aligned">29/37</td>
         
         <td class="center-aligned">37/80</td>
         
         <td class="center-aligned">2.67<sup><span onmouseover="showTextBoard(this, 'z1')" onmouseout="hideTextBoard()">z1)</span></sup></td>
         
         <td class="center-aligned">2.46<sup><span onmouseover="showTextBoard(this, 'z1')" onmouseout="hideTextBoard()">z1)</span></sup></td>
         
         <td class="center-aligned">0.21</td>
         
         <td class="center-aligned">20<sup><span onmouseover="showTextBoard(this, 'z1')" onmouseout="hideTextBoard()">z1)</span></sup></td>
         
         <td class="center-aligned">3.1 × 10<sup>4</sup><sup><span onmouseover="showTextBoard(this, 'u')" onmouseout="hideTextBoard()">u)</span></sup></td>
         
         
      </tr>
   </tbody>
</table>
<div id="text-board"></div>