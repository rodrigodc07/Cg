pkg load image
low = imread('Einstein_low_contrast.png');
med = imread('Einstein_med_contrast.png');
high = imread('Einstein_high_contrast.png');
figure();
subplot (2, 1, 1)
imshow(low);
subplot (2, 1, 2)
imhist(low);
figure();
subplot (2, 1, 1)
imshow(med);
subplot (2, 1, 2)
imhist(med);
figure();
subplot (2, 1, 1)
imshow(high);
subplot (2, 1, 2)
imhist(high);
new_low = imadjust(low,[0.3,0.7],[0,1]);
figure()
subplot (2, 1, 1)
imshow(new_low);
subplot (2, 1, 2)
imhist(new_low);