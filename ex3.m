function ex3(mat)
  teta = -pi/6;
  trans = [1 0 -1/2; 0 1 -1/2; 0 0 1];
  trans_v = inv(trans);
  rot = [cos(teta) -sin(teta) 0 ;sin(teta) cos(teta) 0; 0 0 1];
  full_transform =  rot * trans_v * rot * trans;
  nq = mat;
  while (true)
    nq = apply_transform(nq,full_transform);
    print_mat(nq)
    sleep(0.1)
  endwhile
endfunction