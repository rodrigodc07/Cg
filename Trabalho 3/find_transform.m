function T = find_transform(original,transformada)
    [lin,col] = size(transformada);
    transformada_visivel = [transformada(1,:);transformada(2,:)];
    L = reshape(transformada_visivel,col*(lin-1),1);
    for i = 1:col
       x = original(1,i);
       y = original(2,i);
       x_ = transformada(1,i);
       y_ = transformada(2,i);
       A(2*i-1,:) = [x,y,1,0,0,0,-x*x_,-y*x_];
       A(2*i,:) = [0,0,0,x,y,1,-x*y_,-y*y_];
    endfor
    x = inv(A'*A)*A'*L;
    x = [x;1];
    sizeT = (col*lin+1)/3;
    T = reshape(x,3,3)';
endfunction