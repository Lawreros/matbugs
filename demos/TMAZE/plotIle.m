

function plotIle(I, sub1, sub2, figno, offs)

  
  t = 1:size(I,2);
  J = 2;
  
  for j = 1:J
         subplot(sub1, sub2, j);
         hold on; [y, x] = find(I(1,:) > 0);
         h = plot(x,y+0.05+offs,'s'); set(h, 'MarkerFaceColor','b');
         set(h, 'MarkerEdgeColor', 'k');set(h, 'MarkerSize', 5);
         hold on; [y, x] = find(I(1,:) == 0);
         h = plot(x,y+0.05+offs,'s'); set(h, 'MarkerFaceColor', [0.75 0.75 0.75]);
         set(h, 'MarkerEdgeColor', 'k');;set(h, 'MarkerSize', 5);
         axis([1 t(end)  0 1.30]);
  end
  
  
 