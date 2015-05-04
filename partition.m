function D=partition(A)
	n = length(A);
	%ma opresc la dimensiunea de 32x32, facand inversa pentru dimensiuni <= 32 cu metoda Gauss-Jordan
	if n <= 32
		D=myinverse(A);
		return;
	end
		m = ceil(n/2);
		i=1:m;
		j=m+1:n;
		B1 = partition(A(i,i));
		B4 = partition(A(j,j));
		X1 = partition(A(i,i)-strassen2(strassen2(A(i,j),B4,8),A(j,i),8));	
		X2 = -strassen2(strassen2(B4,A(j,i),8),X1,8);
		X4 = partition(A(j,j)-strassen2(strassen2(A(j,i),B1,8),A(i,j),8));
		X3 = -strassen2(B1,strassen2(A(i,j),X4,8),8);
		D=[X1 X3; X2 X4];
endfunction
