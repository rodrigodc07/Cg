original = [135 493 520 111; 12 17 271 267; 1 1 1 1];
transformada = [1 300 300 1; 1 1 300 300; 1 1 1 1]; 

placa = imread('Placa_de_Trânsito_PARE.jpg');
figure("Name","Imagem Original");
imshow(placa);

T = inv(find_transform(original,transformada));
new_img_1 = zeros(300,300,3,"uint8");
new_img_2 = zeros(300,300,3,"uint8");

for c = 1:300 
	for l = 1:300
		pt = T * [ c; l; 1];
		x = pt(1)/pt(3);
		y = pt(2)/pt(3);
		for i = 1:3
			new_img_1(l,c,i) = placa(round(y),round(x),i);
      w1 = placa(floor(y), floor(x), i) * (abs(x-floor(x))) * (abs(y-floor(y)));
      w2 = placa(ceil(y), floor(x), i)* (abs(x-floor(x)))* (abs(y-ceil(y)));
      w3 = placa(ceil(y), ceil(x), i)* (abs(x-ceil(x)))* (abs(y-ceil(y)));
      w4 = placa(floor(y), ceil(x), i)* (abs(x-ceil(x)))* (abs(y-floor(y)));
      new_img_2(l,c,i) = w1 + w2 + w3 + w4;
		endfor
	endfor		
endfor

figure("Name","Imagem com núcleo constante");
imshow(new_img_1);

figure("Name","Imagem com núcleo trianguar");
imshow(new_img_2);