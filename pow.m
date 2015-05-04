function c=pow(a,n)
	m = length(a);
	c = eye(m);
	while n > 0
	if mod(n,2) == 1
		c = strassen2(c,a);
	end
		n = floor(n/2);
		a = strassen2(a,a);
	end
endfunction
	
