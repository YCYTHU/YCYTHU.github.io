function calcWfn(x, y, z, n, l, m, real) {
	var r = Math.sqrt(x*x + y*y + z*z);
	var cos_theta = z / r;
	var phi = Math.atan(y, x);

	var ret1 = 1;
	for (var i = 0; i < 2*l+1; i++)
		ret1 /= (n - l + i);
	ret1 = ret1 * 4 / n**4;
	ret1 = Math.sqrt(ret1);
	ret1 *= Math.exp(-r / n) * Math.pow(2*r / n, l) * LaguerreL(n-l-1, 2*l+1, 2*r / n);

	var ret2 = 1;
	for (var i = 1; i < 2 * Math.abs(m); i++)
		ret2 /= (l - Math.abs(m) + i);
	ret2 = ret2 * (2*l + 1) / (4*Math.PI);
	ret2 = Math.sqrt(ret2) * Associated_Legendre(l, Math.abs(m), cos_theta);

	if (real) {
		if (m < 0 || m % 2 == 0)
			var ret3 = Math.cos(m * phi);
		else
			var ret3 = -Math.cos(m * phi);
	}
	else {
		if (m < 0 || m % 2 == 0)
			var ret3 = Math.sin(m * phi);
		else
			var ret3 = -Math.sin(m * phi);
	}

	return ret1 * ret2 * ret3;
}

function LaguerreL(n, alpha, x) {
	var L0;
	var L1 = 0;
	var ret = 1;

	for (var i = 1; i <= n; i++) {
		L0 = L1;
		L1 = ret;
		ret = ((2 * i - 1 + alpha - x) * L1 - (i - 1 + alpha) * L0) / i;
	}
	return ret;
}

function Associated_Legendre(l, m, x) {
	var sign = Math.pow(-1, m % 2);
	var ret = 1;
	for (var i = 1; i < 2*m - 1; i = i + 2)
		ret *= i;
	var L1 = sign * ret * Math.pow(1 - x**2, m / 2);
	if (l == m)
		return L1;
	var L2 = x * (2*m + 1) * L1;
	if (l == m + 1)
		return L2;
	for (var index = m + 2; index <= l; index++) {
		L3 = (x * (2 * index - 1) * L2 - (index + m - 1) * L1) / (index - m);
		L1 = L2;
		L2 = L3;
	}
	return L3;
}

//function Associated_Legendre(l, m, x) {
//	if (l == m) {
//		sign = Math.pow(-1, m % 2);
//		var ret = 1;
//		for (var i = 1; i < 2*m - 1; i = i + 2)
//			ret *= i;
//		return sign * ret * Math.pow(1 - x**2, m/2);
//	}
//	else if (l == m + 1)
//		return x * (2*m + 1) * Associated_Legendre(m, m, x);
//	else
//		return (x * (2*l - 1) * Associated_Legendre(l - 1, m, x) - (l + m - 1) * Associated_Legendre(l - 2, m, x)) / (l - m);
//}