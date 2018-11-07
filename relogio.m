clf;
function print_ret(q)
  axis([-3 3 -3 3],'square');
  line([q.p1(1),q.p2(1)],[q.p1(2),q.p2(2)])
  line([q.p1(1),q.p3(1)],[q.p1(2),q.p3(2)])
  line([q.p4(1),q.p3(1)],[q.p4(2),q.p3(2)])
  line([q.p4(1),q.p2(1)],[q.p4(2),q.p2(2)])
endfunction
function novo_quadrado = transform_object(q,rot)
  novo_quadrado.p1=rot*q.p1;
  novo_quadrado.p2=rot*q.p2;
  novo_quadrado.p3=rot*q.p3;
  novo_quadrado.p4=rot*q.p4;
endfunction
function print_digit(d)
  teta = -pi/6*d;
  rot = [cos(teta) -sin(teta);sin(teta) cos(teta)];
  posi = [0;1.8];
  posi = rot*posi;
  text (posi(1), posi(2), int2str(d))
endfunction  
function plot_clock
  r = 2;
  x = -r:0.01:r;
  y = (r^2 - x .^ 2) .^ 0.5;
  plot(x,y, "linewidth", 4, x,-y, "linewidth", 4);
  for i = 1:12
    print_digit(i)
  endfor
endfunction

q.p1=[-0.25;0];
q.p2=[0.25;0];
q.p3=[-0.25;1];
q.p4=[0.25;1];

q2.p1=[-0.25;0];
q2.p2=[0.25;0];
q2.p3=[-0.25;2];
q2.p4=[0.25;2];

print_ret(q);
print_ret(q2);

teta = -pi/360;
rot = [cos(teta) -sin(teta);sin(teta) cos(teta)];

teta = -pi/30;
rot2 = [cos(teta) -sin(teta);sin(teta) cos(teta)];

while(true)
  q = transform_object(q,rot);
  q2 = transform_object(q2,rot2);
  clf;
  plot_clock
  print_ret(q);
  print_ret(q2);
  sleep(1);
endwhile