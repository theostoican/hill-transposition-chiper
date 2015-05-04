function y=modulo(x)
	% c, a, b sunt coeficientii Bezout ai ecuatiei ax + 29b = 1;
	%gcd(x,29) va fi 1, altfel inversarea nu e posibila
	% noi vom determina  y, unde x*y = 1 mod29, adica x*y - 29q = 1, unde q=intreg.
	% Deci, y-ul va fi inversul, pe care aplicam apoi mod 29
	[c a b]=gcd(x,29);
	y=mod(a,29);
end
