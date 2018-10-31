clf;
function print_ret(q)
  axis([-3 3 -3 3],'square');
  line([q.p1(1),q.p2(1)],[q.p1(2),q.p2(2)])
  line([q.p1(1),q.p3(1)],[q.p1(2),q.p3(2)])
  line([q.p4(1),q.p3(1)],[q.p4(2),q.p3(2)])
  line([q.p4(1),q.p2(1)],[q.p4(2),q.p2(2)])
endfunction
function novo_quadrado = apply_transform(q,rot)
  clf;
  novo_quadrado.p1=rot*q.p1;
  novo_quadrado.p2=rot*q.p2;
  novo_quadrado.p3=rot*q.p3;
  novo_quadrado.p4=rot*q.p4;
endfunction

q.p1=[0;0;1];
q.p2=[1;0;1];
q.p3=[0;1;1];
q.p4=[1;1;1];

teta = -pi/6;
trans = [1 0 -1/2; 0 1 -1/2; 0 0 1];
trans_v = inv(trans);
rot = [cos(teta) -sin(teta) 0 ;sin(teta) cos(teta) 0; 0 0 1];
full_transform =  trans_v * rot * trans;
nq = q;
while (true)
  nq = apply_transform(nq,full_transform);
  print_ret(nq)
  sleep(0.1)
endwhile