function ex1(mat,teta)
  rot = [cos(teta) -sin(teta) 0 ;sin(teta) cos(teta) 0; 0 0 1];
  nq = mat;
  while (true)
    nq = apply_transform(nq,rot);
    print_mat(nq)
    sleep(0.1)
  endwhile
endfunction