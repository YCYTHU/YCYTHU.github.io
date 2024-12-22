---
title: 离心机配平方法
tags: 
- Number theory
- Code
- Python
cover: https://cdn.jsdelivr.net/gh/ycythu/assets@main/images/cover/centrifuge.jpg
---
离心机配平要求离心机内试管的重心保持在转子的中心，当试管数为离心机孔数的因数时，只需要按相同间隔分布试管即可达到平衡，但若试管数不是离心机孔数的因数时，则很难快速辨别是否存在配平方案。本文列出了不同孔数的离心机支持的试管数以及配平方案图示。
<!--more-->
<style type="text/css">
	.unable {
		width: 75px;
		height: 75px;
	}
	#result td {
		width: 75px;
		text-align: center;
		border: 1px solid #000;
		padding: 0;
	}
	#solTable {
		display: table;
		margin-top: 10px;
	}
	#solTable td {
		width: 75px;
		height: 75px;
		padding: 0;
	}
	svg {
		display: block;
	}
</style>

## 6~24孔离心机配平方案

<div style="height: 80vh;overflow: auto;" id="result">
	<table style="position: sticky;top: 0;display: table;margin-bottom: 0;">
		<tbody style="background-color: #e2e2e2;">
			<tr>
				<td><div style="width: 75px">0</div></td>
				<td><div style="width: 75px">1</div></td>
				<td><div style="width: 75px">2</div></td>
				<td><div style="width: 75px">3</div></td>
				<td><div style="width: 75px">4</div></td>
				<td><div style="width: 75px">5</div></td>
				<td><div style="width: 75px">6</div></td>
				<td><div style="width: 75px">7</div></td>
				<td><div style="width: 75px">8</div></td>
				<td><div style="width: 75px">9</div></td>
				<td><div style="width: 75px">10</div></td>
				<td><div style="width: 75px">11</div></td>
				<td><div style="width: 75px">12</div></td>
			</tr>
		</tbody>
	</table>
	<table id="solTable">
		<tbody>
			<tr data-hole-num="6"><td data-sequence="000000" class="solution"></td><td class="unable"><div style="width:75px;"></div></td><td data-sequence="100100" class="solution"></td><td data-sequence="101010" class="solution"></td></tr>
			<tr data-hole-num="7"><td data-sequence="0000000" class="solution"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td></tr>
			<tr data-hole-num="8"><td data-sequence="00000000" class="solution"></td><td class="unable"></td><td data-sequence="10001000" class="solution"></td><td class="unable"></td><td data-sequence="10011001" class="solution"></td></tr>
			<tr data-hole-num="9"><td data-sequence="000000000" class="solution"></td><td class="unable"></td><td class="unable"></td><td data-sequence="100100100" class="solution"></td><td class="unable"></td></tr>
			<tr data-hole-num="10"><td data-sequence="0000000000" class="solution"></td><td class="unable"></td><td data-sequence="1000010000" class="solution"></td><td class="unable"></td><td data-sequence="1000110001" class="solution"></td><td data-sequence="1010101010" class="solution"></td></tr>
			<tr data-hole-num="11"><td data-sequence="00000000000" class="solution"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td></tr>
			<tr data-hole-num="12"><td data-sequence="000000000000" class="solution"></td><td class="unable"></td><td data-sequence="100000100000" class="solution"></td><td data-sequence="100010001000" class="solution"></td><td data-sequence="100001100001" class="solution"></td><td data-sequence="100011001001" class="solution"></td><td data-sequence="100011100011" class="solution"></td></tr>
			<tr data-hole-num="13"><td data-sequence="0000000000000" class="solution"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td></tr>
			<tr data-hole-num="14"><td data-sequence="00000000000000" class="solution"></td><td class="unable"></td><td data-sequence="10000001000000" class="solution"></td><td class="unable"></td><td data-sequence="10000011000001" class="solution"></td><td class="unable"></td><td data-sequence="10000111000011" class="solution"></td><td data-sequence="10101010101010" class="solution"></td></tr>
			<tr data-hole-num="15"><td data-sequence="000000000000000" class="solution"></td><td class="unable"></td><td class="unable"></td><td data-sequence="100001000010000" class="solution"></td><td class="unable"></td><td data-sequence="100100100100100" class="solution"></td><td data-sequence="100011000110001" class="solution"></td><td class="unable"></td></tr>
			<tr data-hole-num="16"><td data-sequence="0000000000000000" class="solution"></td><td class="unable"></td><td data-sequence="1000000010000000" class="solution"></td><td class="unable"></td><td data-sequence="1100000011000000" class="solution"></td><td class="unable"></td><td data-sequence="1110000011100000" class="solution"></td><td class="unable"></td><td data-sequence="1111000011110000" class="solution"></td></tr>
			<tr data-hole-num="17"><td data-sequence="00000000000000000" class="solution"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td></tr>
			<tr data-hole-num="18"><td data-sequence="000000000000000000" class="solution"></td><td class="unable"></td><td data-sequence="100000000100000000" class="solution"></td><td data-sequence="100000100000100000" class="solution"></td><td data-sequence="110000000110000000" class="solution"></td><td data-sequence="110000100010100000" class="solution"></td><td data-sequence="111000000111000000" class="solution"></td><td data-sequence="111000100011100000" class="solution"></td><td data-sequence="111100000111100000" class="solution"></td><td data-sequence="111010100011110000" class="solution"></td></tr>
			<tr data-hole-num="19"><td data-sequence="0000000000000000000" class="solution"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td></tr>
			<tr data-hole-num="20"><td data-sequence="00000000000000000000" class="solution"></td><td class="unable"></td><td data-sequence="10000000001000000000" class="solution"></td><td class="unable"></td><td data-sequence="11000000001100000000" class="solution"></td><td data-sequence="10001000100010001000" class="solution"></td><td data-sequence="11100000001110000000" class="solution"></td><td data-sequence="11001000100110001000" class="solution"></td><td data-sequence="11110000001111000000" class="solution"></td><td data-sequence="11011000100111001000" class="solution"></td><td data-sequence="11111000001111100000" class="solution"></td></tr>
			<tr data-hole-num="21"><td data-sequence="000000000000000000000" class="solution"></td><td class="unable"></td><td class="unable"></td><td data-sequence="100000010000001000000" class="solution"></td><td class="unable"></td><td class="unable"></td><td data-sequence="110000011000001100000" class="solution"></td><td data-sequence="100100100100100100100" class="solution"></td><td class="unable"></td><td data-sequence="111000011100001110000" class="solution"></td><td class="unable"></td><td class="unable"></td></tr>
			<tr data-hole-num="22"><td data-sequence="0000000000000000000000" class="solution"></td><td class="unable"></td><td data-sequence="1000000000010000000000" class="solution"></td><td class="unable"></td><td data-sequence="1100000000011000000000" class="solution"></td><td class="unable"></td><td data-sequence="1110000000011100000000" class="solution"></td><td class="unable"></td><td data-sequence="1111000000011110000000" class="solution"></td><td class="unable"></td><td data-sequence="1111100000011111000000" class="solution"></td><td data-sequence="1010101010101010101010" class="solution"></td></tr>
			<tr data-hole-num="23"><td data-sequence="00000000000000000000000" class="solution"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td><td class="unable"></td></tr>
			<tr data-hole-num="24"><td data-sequence="000000000000000000000000" class="solution"></td><td class="unable"></td><td data-sequence="100000000000100000000000" class="solution"></td><td data-sequence="100000001000000010000000" class="solution"></td><td data-sequence="110000000000110000000000" class="solution"></td><td data-sequence="110000001000010010000000" class="solution"></td><td data-sequence="111000000000111000000000" class="solution"></td><td data-sequence="111000001000011010000000" class="solution"></td><td data-sequence="111100000000111100000000" class="solution"></td><td data-sequence="111100001000011110000000" class="solution"></td><td data-sequence="111110000000111110000000" class="solution"></td><td data-sequence="111100001110000111100000" class="solution"></td><td data-sequence="111111000000111111000000" class="solution"></td></tr>
		</tbody>
	</table>
</div>

## 生成配平方案的Python代码

`centrifuge(n)`函数返回长度为n+1的布尔值列表，其中第k项代表k个试管能否在n孔离心机中配平。`centrifuge_k(n, k)`则以布尔值列表的形式给出了配平方案。

```python
def prime_divisors(n):
    primes = []
    p = 2
    while p**2 <= n:
        if n % p == 0:
            primes.append(p)
            n //= p
        else:
            p += 1 if p % 2 == 0 else 2
    if n > 1:
        primes.append(n)
    return primes

def factorize(k: int, nums: list) -> list:
    # 返回由给定数加和得到指定数值的方案
    def _factorize(k, nums, res: list):
        for p in nums:
            if k % p == 0:
                res.extend([p] * (k // p))
                return True
            else:
                for i in range(1, k // p):
                    if _factorize(k - p * i, [n for n in nums if n != p], res):
                        res.extend([p] * i)
                        return True
        return False
    res = []
    _factorize(k, nums, res)
    return res

def centrifuge(n):
    # 返回长度为n+1的列表，第k项代表k个试管能否在n孔离心机中配平
    F = [True] + [False] * n
    for p in prime_divisors(n):
        for i in range(p, n + 1):
            F[i] = F[i] or F[i - p]
    return [F[k] and F[n - k] for k in range(n + 1)]

def centrifuge_k(n, k):
    # 返回长度为n的列表，代表了k个试管在n孔离心机中的配平方案
    if n == k:
        return [True] * n
    factors = factorize(k, prime_divisors(n))
    pos = [False] * n
    def c(factors: list, pos: list) -> bool:
        if sum(pos) == k:
            return True
        if not factors:
            return False
        p = factors.pop(0)
        pos_wanted = [n // p * i for i in range(p)]
        for offset in range(n):
            pos_rotated = [(i + offset) % n for i in pos_wanted]
            if not any(pos[i] for i in pos_rotated):
                for i in pos_rotated:
                    pos[i] = True
                if not c(factors, pos):
                    for i in pos_rotated:
                        pos[i] = False
                else:
                    return True
        factors.append(p)
    c(factors, pos)
    return pos
```

<script type="text/javascript">
	const allTd = document.getElementsByClassName('solution');
	const svgLen = 75;
	for (let index = 0; index < allTd.length; index++) {
		sequence = Array.from(allTd[index].getAttribute('data-sequence'));
		allTd[index].innerHTML = drawSVG(sequence);
	}
	function drawSVG(sequence) {
		num = sequence.length;
		radius = Math.min(7, 25*Math.PI*0.7 / num);
		svgStr = '';
		for (let index = 0; index < num; index++) {
			let x = 25 * Math.cos(index*2*Math.PI / num) + svgLen/2;
			let y = 25 * Math.sin(index*2*Math.PI / num) + svgLen/2;
			let color = 'none';
			if (sequence[0] == '0')
				svgStr += '<text x="' + (svgLen/2).toString() + '" y="' + (svgLen/2+5).toString() + '" font-family="Arial" font-size="16" font-weight="bold" fill="black" text-anchor="middle">' + num.toString() + '</text>'
			if (sequence[index] == '1')
				color = 'black';
			svgStr += '<circle cx="' + x.toString() + '" cy="' + y.toString() + '" r="' + radius.toString() + '" fill="' + color + '" stroke="black" stroke-width="2"/>';
		}
		return '<svg width="' + svgLen.toString() + '" height="' + svgLen.toString() + '" xmlns="http://www.w3.org/2000/svg">' + svgStr + '</svg>';
	}
</script>