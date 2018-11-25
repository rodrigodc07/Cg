original = [0,0;0 1; 1 1; 1 0];
transformada = [2,1;3 5; 6 6; 7 2];
[lin,col] = size(transformada);
L = reshape(transformada',lin*col,1);
A = zeros(col,8);
for i = 1:lin
 x = original(i,1);
 y = original(i,2);
 x_ = transformada(i,1);
 y_ = transformada(i,2);
 A(2*i-1,:) = [x,y,1,0,0,0,-x*x_,-y*x_];
 A(2*i,:) = [0,0,0,x,y,1,-x*y_,-y*y_];
endfor
x = inv(A'*A)*A'*L;
x = [x;1];
sizeT = (lin*col+1)/3;
T = reshape(x,3,sizeT)';