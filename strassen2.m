function c = strassen2(a, b, nmin)
	n = length(a);
	realn = n;
	%ma opresc la dimensiune de 32x32, intorc rezultatul folosind inmultirea standard Octave
	if n <= 32
		c = a * b;
	else
		if mod(n,2) ~= 0
			a(1 : n + 1, n + 1) = 0;
			a(n + 1, 1 : n) = 0;
			b(1 : n + 1, n + 1) = 0;
			b(n + 1, 1 : n) = 0;
			n = n + 1;
		end
		m = n/2;
		i = 1 : m;
		j = m + 1 : n;
		M1 = strassen2(a(i,i) + a(j,j), b(i,i) + b(j,j),8);
		M2 = strassen2(a(j,i) + a(j,j), b(i,i),8);
		M3 = strassen2(a(i,i), b(i,j) - b(j,j),8);
		M4 = strassen2(a(j,j), b(j,i) - b(i,i),8);
		M5 = strassen2(a(i,i) + a(i,j), b(j,j),8);
		M6 = strassen2(a(j,i) - a(i,i), b(i,i) + b(i,j),8);
		M7 = strassen2(a(i,j) - a(j,j), b(j,i) + b(j,j),8);
		c = [M1 + M4 - M5 + M7  M3 + M5; M2 + M4 M1 - M2 + M3 + M6];
		% ma intorc la dimensiunea initiala, in cazul in care fac padding
		c = c(1:realn, 1:realn);
	end
endfunction
