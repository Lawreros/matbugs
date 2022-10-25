

function plotI(I)

%plots binary data
  t = 1:length(I);
  
  hold on; [y, x] = find(I > 0);
  h = plot(x,y+0.05,'s'); set(h, 'MarkerFaceColor','k');
  set(h, 'MarkerEdgeColor', 'k');
  hold on; [y, x] = find(I == 0);
  h = plot(x,y+0.05,'s'); set(h, 'MarkerFaceColor', [0.75 0.75 0.75]);
  set(h, 'MarkerEdgeColor', 'k');
  axis([1 t(end)  0 1.10]); box on;
  
  