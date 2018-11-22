pkg load image
function filter(path)
  img = im2double(imread(path));
  filtro_media = fspecial('average',3);
  filtro_gaus = fspecial('gaussian',3,0.2);
  img_r = img(:,:,1);
  img_g = img(:,:,2);
  img_b = img(:,:,3);
  img_r_filtrado = imfilter(img_r,filtro_media);
  img_g_filtrado = imfilter(img_g,filtro_media);
  img_b_filtrado = imfilter(img_b,filtro_media);
  img_filtrado_med = cat(3, img_r_filtrado, img_g_filtrado,img_b_filtrado);
  combo_img = cat(1, img, img_filtrado_med);
  img_r_filtrado_gaus = imfilter(img_r,filtro_gaus);
  img_g_filtrado_gaus = imfilter(img_g,filtro_gaus);
  img_b_filtrado_gaus = imfilter(img_b,filtro_gaus);
  img_filtrado_gaus = cat(3, img_r_filtrado_gaus, img_g_filtrado_gaus,img_b_filtrado_gaus);
  combo_img = cat(1, img, img_filtrado_med, img_filtrado_gaus);
  figure();
  imshow(combo_img);
endfunction

filter('leme.bmp')
filter('lion.png')
