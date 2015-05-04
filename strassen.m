function strassen(file1,file2)
	A = dlmread(file1);
	%dlmread citeste toate liniile
	%primul element va reprezenta puterea la care va fi ridicata matricea
	n = A(1,1);
	%trunchiez matricea citita, la matricea reala, care trebuie inversata si ridicata la n
	[m1 m2] = size(A);
	A = A(2:m1,1:m2);
	A = pow(A,n);
	A = partition(A);
	dlmwrite(file2, A, ' ');
endfunction
