function b = cominv(a)
	n=length(a);
	b=eye(n);
	for i =1:n
		modpivot=modulo(a(i,i));
		% voi imparti linia i la imversul pivotului modulo 29
		for k=1:n  
			a(i,k)=modpivot*a(i,k);
			b(i,k)=modpivot*b(i,k);
		end
		a=mod(a,29);
		b=mod(b,29);
		% dupa cele 2 for-uri vom avea zero pe coloana i
		for j = 1 : i - 1
			aux = -a(j,i);
			a(j,1:n)+=aux*a(i,1:n);
			b(j,1:n)+=aux*b(i,1:n);
		end
		for j = i + 1 : n
			aux = -a(j,i);
			a(j,1:n) += aux*a(i,1:n);
			b(j,1:n) += aux*b(i,1:n);
		end
		a=mod(a,29)
		b=mod(b,29);
	end
endfunction
