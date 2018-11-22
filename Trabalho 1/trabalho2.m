pkg load image
leme = im2double(imread('leme.bmp'));
gama = 2/3;
leme_novo = imadjust(leme,[],[],gama);
combo_leme = cat(2, leme, leme_novo);
imshow(combo_leme)