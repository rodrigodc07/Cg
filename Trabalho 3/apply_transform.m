function nova_matriz = apply_transform(m,T)
 [lin,col] = size(m);
 nova_matriz = zeros(lin,col);
 mat = T*m;
 for i = 1:col
     linha = mat(:,i);
     dim = linha(3);
     if dim !=1
       fac = 1/dim;
       linha = linha * fac;
     endif
     nova_matriz(:,i) = linha;      
  endfor
endfunction