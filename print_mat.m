function print_mat(q)
  clf;
  axis([-3 3 -3 3],'square');
  [dim,qp] = size(q);
  for i = 1:qp-1
    line([q(1,i),q(1,i+1)],[q(2,i),q(2,i+1)])
  endfor
  line([q(1,1),q(1,qp)],[q(2,1),q(2,qp)])
endfunction