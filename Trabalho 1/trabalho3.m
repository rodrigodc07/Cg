pkg load image
function filter(path)
  img = im2double(imread(path));
  filtro_media = [1,1,1;1,1,1;1,1,1]/9;
  filtro_gaus = [1,7,1;7,54,7;1,7,1]/86;
  img_r = img(:,:,1);
  img_g = img(:,:,2);
  img_b = img(:,:,3);
  img_r_filtrado_med = imfilter(img_r,filtro_media);
  img_g_filtrado_med = imfilter(img_g,filtro_media);
  img_b_filtrado_med = imfilter(img_b,filtro_media);
  img_filtrado_med = cat(3, img_r_filtrado_med, img_g_filtrado_med,img_b_filtrado_med);
  img_r_filtrado_gaus = imfilter(img_r,filtro_gaus);
  img_g_filtrado_gaus = imfilter(img_g,filtro_gaus);
  img_b_filtrado_gaus = imfilter(img_b,filtro_gaus);
  img_filtrado_gaus = cat(3, img_r_filtrado_gaus, img_g_filtrado_gaus,img_b_filtrado_gaus);
  combo_img = cat(1, img, img_filtrado_med, img_filtrado_gaus);
  figure()
  imshow(combo_img);
endfunction

filter('leme.bmp')
filter('lion.png')
