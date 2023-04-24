---
title: Probability Effect in Acetalization of Polyvinyl alcohol
tags: Chemistry
cover: 
---

Suppose there is a one-dimensional array of $n$ balls, as shown in Figure 1.

<!--more-->

<div align=center>
<img src="\assets\images\20230424-figure1.png" width="300">
</div>

Now randomly pick two adjacent balls and take them away (Figure 2), the removed ball leaves an empty spot in the array. Repeat this process continuously. 

<div align=center>
<img src="\assets\images\20230424-figure2.png" width="300">
</div>

Since the positions of the balls to be taken are random, there may be balls that do not have adjacent balls on both sides (Figure 3), such balls will not be picked.

<div align=center>
<img src="\assets\images\20230424-figure3.png" width="300">
</div>

Continue this process until no balls remain or can be picked. The number of remaining balls in the array is recorded as $s$. Find the mathematical expectation of $s$.

---

The mathematical expectation of $s$ is a function of $n$, denoted $E(s|n)=f(n)$. Suppose there are $i$ balls in the array, if we take

- the $1^{st}$ and $2^{nd}$ balls away, The problem is simplified to $0$ and $i-2$ balls cases;
- the $2^{nd}$ and $3^{rd}$ balls away, The problem is simplified to $1$ and $i-3$ balls cases;
- the $3^{rd}$ and $4^{th}$ balls away, The problem is simplified to $2$ and $i-4$ balls cases;
- ...
- the $(i-1)^{th}$ and $i^{th}$ balls away, The problem is simplified to $i-2$ and $0$ balls cases;

Each case is counted twice and then divided by all $i-1$ cases. So:

$$f(n)=\frac{2}{n-1}\Sigma_{i=1}^{n-2}f(i)$$

Therefore:

$$(n-1)f(n)=2\Sigma_{i=1}^{n-2}f(i)\\nf(n+1)=2\Sigma_{i=1}^{n-2}f(i)+2f(n-1)$$

We