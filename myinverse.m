function b=myinverse(a)
	n = length(a);
	b=eye(n);
	for i = 1:n
		pivot =1/a(i,i);
		% multiplica linia cu pivotul
		a(i,:) *= pivot;
		b(i,:) *= pivot;
		% scade din linia i a matricei "a" toate celelalte linii ale matricei in cele 2 for-uri
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
		%la final, vom avea zero pe coloana i a matricei "a", cu exceptia diagonalei principale
	end
endfunction
