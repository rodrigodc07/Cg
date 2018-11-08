original = [0,0;0 1; 1 1; 1 0]
transformada = [2,1;3 5; 6 6; 7 2]
[lin,col] = size(transformada);
L = reshape(transformada,1,lin*col)
A = zeros(8,lin*col)
for i = 1:lin*col
 A(2*i-1,:) = [original(1,i),original(2,i),1,0,0,0,-original(i,1)*transformada(1,i),-original(2,i)*transformada(1,i)];
 A(2*i,:) = [0,0,0,original(1,i),original(2,i),1,-original(i,1)*transformada(2,i),-original(2,i)*transformada(2,i)];
endfor