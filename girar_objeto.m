clf;
function print_mat(q)
  clf;
  axis([-3 3 -3 3],'square');
  [dim,qp] = size(q);
  for i = 1:qp-1
    line([q(1,i),q(1,i+1)],[q(2,i),q(2,i+1)])
  endfor
  line([q(1,1),q(1,qp)],[q(2,1),q(2,qp)])
endfunction

function nova_matriz = apply_transform(q,rot)
 nova_matriz=rot*q;
endfunction

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