original = [135 500 520 110; 10 25 270 265; 1 1 1 1];
transformada = [1 600 600 1; 1 1 600 600; 1 1 1 1]; 

placa = imread('Placa_de_Trânsito_PARE.jpg');
figure();
imshow(placa);

T = inv(find_transform(original,transformada));
constante = zeros(600,600,3,"uint8");
triangular = zeros(600,600,3,"uint8");

for i = 1:600 
	for j = 1:600
    ponto = [i; j; 1];
		novo_ponto = apply_transform(ponto, T);
		x = novo_ponto(1);
		y = novo_ponto(2);
    for k = 1:3
      constante(j,i,k) = placa(round(y),round(x),k);
      w1 = placa(floor(y), floor(x), k) * (abs(x-floor(x))) * (abs(y-floor(y)));
      w2 = placa(ceil(y), floor(x), k)* (abs(x-floor(x)))* (abs(y-ceil(y)));
      w3 = placa(ceil(y), ceil(x), k)* (abs(x-ceil(x)))* (abs(y-ceil(y)));
      w4 = placa(floor(y), ceil(x), k)* (abs(x-ceil(x)))* (abs(y-floor(y)));
      triangular(j,i,k) = w1 + w2 + w3 + w4;	
     endfor
	endfor		
endfor

figure();
imshow(constante);

figure();
imshow(triangular);