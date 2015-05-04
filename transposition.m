function transposition()
	fin1 = fopen('input1C','r');
	fout2 = fopen('key1C','w');
	fout = fopen('output1C','w');
	k = fscanf(fin1,'%d', 1);
	k = mod(k,29);
	n = fscanf (fin1, '%d', 1);
	text = fgetl(fin1);
	text = fgetl(fin1);
	text = lower(text);
	leng = length (text);
	disp(text);
	disp(text);
	j = 0;
	%partea de codificare
	for i = 1:leng
		if text(i) == '.'
			j = j + 1;
			convert(j) = 27;
		elseif text(i) == ''''
			j = j + 1;
			convert(j) = 28;
		elseif text(i) == ' '
			j = j + 1;
			convert(j) = 0;
		else
			j = j + 1;
			convert(j) = double(text(i)) - 96;
		end
		if mod (i, 1000) == 0 && mod (1000, n) ~= 0
			padd = n - mod (1000, n);
			convert (j + 1 : j + padd) = -1;
			j = j + padd;
		end
	end
	%padding pe ce ramane din text daca mod(leng,1000) ~= 0
	diff = mod (leng, 1000);
	if diff ~= 0 && leng > 1000
		diff = n - mod (diff, n);
		convert (j + 1 : j + diff) = -1;
		j = j + diff;
	end
	%cazul cand lungimea e mai mica decat 1000
	if leng < 1000
		diff = n - mod (leng, n);
		if diff ~= n
			convert (j + 1 : j + diff) = -1;
			j = j + diff;
		end
	end
	%Acum, lungimea sirului "convertit" este divizibila cu n
	convert = convert';
	disp (convert);
	times = j/n;
	%matricea de codificare
	key = eye (n + 1);
	key(1 : n, n + 1) = k;
	dlmwrite('key1C', key, ' ');
	nr = 0;
	for i = 1 : times
		%la fiecare 1000 de caractere, se schimba matricea
		if mod (nr, 1000) == 0 && nr >= 1000
			k = k + 1;
			key (1 : n, n + 1) = k;
		end
		lower = n * (i - 1) + 1;
		upper = n * i;
		vector = convert (lower : upper);
		vector (n + 1) = 1;
		til = n;
		for i = 1 : n
			if vector(i) == -1
				til = i - 1;
				break;
			end
		end
		Result = key * vector;
		%decodificare
		Result = mod (Result, 29);
		for i2 = 1 : til
			if Result(i2) ~= 0 && Result(i2) ~= 27 && Result(i2) ~= 28
				Result(i2) = Result(i2) + 96;
				fprintf (fout, '%c', char (Result(i2)));	
			elseif Result(i2) == 0
				fprintf (fout, ' ');
			elseif Result(i2) == 27
				fprintf (fout, '.');
			else
				fprintf (fout, '''');
			end
			%nr e un contor, care imi spune cand ajung la 1000, 2000,... caractere
			nr = nr + 1;
		end
	end
	fclose ('all');
endfunction
				
