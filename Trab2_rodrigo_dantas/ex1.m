function ex1(mat,graus)
  print_mat(mat)
  [cx,cy] = calc_center(mat);
  trans = [1 0 -cx; 0 1 -cy; 0 0 1];
  trans_v = inv(trans);
  teta = graus * pi/180;
  rot = [cos(teta) -sin(teta) 0 ;sin(teta) cos(teta) 0; 0 0 1];
  full_transform =  trans_v * rot * trans;
  nova_mat = apply_transform(mat,full_transform);
  figure()
  print_mat(nova_mat)
endfunction
