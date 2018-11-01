function ex1(mat,teta)
  [cx,cy] = calc_center(mat)
  trans = [1 0 -cx; 0 1 -cy; 0 0 1];
  trans_v = inv(trans);
  rot = [cos(teta) -sin(teta) 0 ;sin(teta) cos(teta) 0; 0 0 1];
  full_transform =  trans_v * rot * trans;
  nq = mat;
  while (true)
    nq = apply_transform(nq,full_transform);
    print_mat(nq)
    sleep(0.1)
  endwhile
endfunction