function [cx,cy] = calc_center(mat)
  minx = min(mat(1,:));
  maxx = max(mat(1,:));
  miny = min(mat(2,:));
  maxy = max(mat(2,:));
  cx = (minx + maxx) /2;
  cy = (miny + maxy) /2;
endfunction