function show_failed(set, fld, ras)

[M,N] = size(set{1});
w=round(sqrt(N));

img = zeros(w*10,w*10);
for ld=1:10
for li=1:10
   if fld(ld,li) ~= 0
      img((ld-1)*w+1:ld*w, (li-1)*w+1:li*w) = ...
         reshape(set{ld}(fld(ld,li),:),w,w).';
   end
end
end

imagesc(img);
% create color maps
colormap(1-gray(256));
for ld=1:10
for li=1:10
   text((li-1)*w+w*3/4,((ld-1)*w)+w*3/4,sprintf('%d',ras(ld,li)));
end
end