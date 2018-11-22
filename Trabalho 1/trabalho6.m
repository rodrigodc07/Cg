pkg load image

r = rgb2gray(im2double(imread('gavea_r.png')));
g = rgb2gray(im2double(imread('gavea_g.png')));
b = rgb2gray(im2double(imread('gavea_b.png')));
nir = rgb2gray(im2double(imread('gavea_nir.png')));
ndvi = (nir-r)./(nir+r);
limi_ndvi = ndvi < 0.03;
ind_veg = find(limi_ndvi);

gavea = cat(3,r,g,b);
imshow(gavea)

r_veg = r;
r_veg(ind_veg) = 0;
g_veg = g;
g_veg(ind_veg) = 0;
b_veg = b;
b_veg(ind_veg) = 0;

gavea_veg = cat(3,r_veg,g_veg,b_veg);
figure()
imshow(gavea_veg);

ind_not_veg = find(!limi_ndvi);

r_not_veg = r;
r_not_veg(ind_not_veg) = 0;
g_not_veg = g;
g_not_veg(ind_not_veg) = 0;
b_not_veg = b;
b_not_veg(ind_not_veg) = 0;

gavea_not_veg = cat(3,r_not_veg,g_not_veg,b_not_veg);
figure()
imshow(gavea_not_veg);