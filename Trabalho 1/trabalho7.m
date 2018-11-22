pkg load image

digital = im2double(imread('fingerprint.jpg'));
limiar = 0.5;
delta = 1
while delta > 0.00001
  limi_digital = digital > limiar;
  x_indx = find(limi_digital);
  y_indx = find(!limi_digital);
  x = digital(x_indx);
  y = digital(y_indx);
  novo_limiar = (mean(x)+mean(y))/2;
  delta = abs(novo_limiar-limiar);
  limiar = novo_limiar;
endwhile
subplot (3, 1, 1)
imshow(digital);
subplot (3, 1, 2)
imhist(digital);
title(limiar)
subplot (3, 1, 3)
imshow(limi_digital);