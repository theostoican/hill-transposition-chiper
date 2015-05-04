function matrixCipher()
	fin1=fopen('input1A','r');
	fin2=fopen('key1A','r');
	fout=fopen('output1A','w');
	text=fgetl(fin1);
	n=fscanf(fin2,'%d',1);
	A=fscanf(fin2,'%d',[n n]);
	%Octave citeste transpusa, inmultirile vor fi efectuate ca atare
	text=lower(text);
	%partea de codificare a fiecarui caracter conform cifrelor din metoda de criptare Hill
	j=1;
	for i=1:length(text)
		if text(i)=='.'
			convert(j)=27;
			j=j+1;
		elseif text(i)==''''
			convert(j)=28;
			j=j+1;
		elseif text(i)==' '
			convert(j)=0;
			j=j+1;
		else 
			convert(j)=double(text(i))-96;
			j=j+1;
		end
	end
	arraylength=length(convert);
	convert=convert';
	times = arraylength/n;
	%se face padding daca lungimea sirului nu e divizibila cu n
	if arraylength ~= n
		if arraylength < n
			convert (arraylength + 1:n)=0;
		else
			times=arraylength/n;
			times=ceil(times);
			convert (arraylength + 1: times*n)=0;
		end
	end
	for i=1:times
		lower=n*(i-1)+1;
		upper=n*i;
		Result(i,:)= convert(lower:upper);
	end
	%se inmulteste la dreapta, fiind transpusa
	Result=Result*A;
	disp(Result);
	[m n] = size(Result);
		Result=mod(Result,29);
	disp(Result);
	%codifica (daca e caracter, gaseste codul ASCII, si il printeaza folosind cast
	for i = 1:m
		for j = 1:n
			if Result(i,j)~=0 && Result(i,j) ~= 27 && Result(i,j)~= 28
				Result(i,j)=Result(i,j)+96;
				fprintf(fout,'%c',char(Result(i,j)));
			elseif Result(i,j) == 0
				fprintf(fout,' ');
	elseif Result(i,j) == 27
				fprintf(fout,'.');
			else
				fprintf(fout,'''');
			end
		end
	end
	fclose('all');
endfunction

