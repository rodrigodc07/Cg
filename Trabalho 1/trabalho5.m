pkg load image

ferrari = im2double(imread('Ferrari.jpg'));
imshow(ferrari)
ferrari = ferrari(:,:,1);

Sx=[-1 0 1; -2 0 2; -1 0 1];
Sy=Sx';

Gx = imfilter(ferrari,Sx);
Gy = imfilter(ferrari,Sy);

mag = (Gx.^2 + Gy.^2).^(1/2);
figure()
imshow(mag)
angulos = atan(Gy./Gx);

mag_fort = mag > 0.5;
imshow(mag_fort);

amarelo = (angulos < pi()/6 & angulos > -pi()/6 );
verde = (angulos < pi()/3 & angulos > pi()/6);
vermelho = (angulos < -pi()/6 & angulos > -pi()/3);
azul = (angulos < -pi()/3 | angulos > pi()/3);

idx_amarelo = find(amarelo);
idx_verde = find(verde);
idx_vermelho = find(vermelho);
idx_azul = find(azul);

color_map = ones(540,960);
color_map(idx_vermelho)=2;
color_map(idx_amarelo)=3;
color_map(idx_verde)=4;
color_map(idx_azul)=5;

color_fort = color_map.*mag_fort;
map = [0 ,0 ,0;
       1, 0 ,0;
       1, 1, 0;
       0, 1 ,0;
       0, 0 ,1];
figure()
imshow(color_fort,map)