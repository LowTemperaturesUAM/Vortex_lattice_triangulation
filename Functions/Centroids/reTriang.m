function newTrian = reTriang(center, action, trian, centrosc)
newTrian = trian;
length(newTrian(:,1))
TRI = delaunay(centrosc(:,1), centrosc(:,2));
if action 
    h = 0;
    for i = 1:length(TRI(:,1))
        if sum(TRI(i,:) ==center)>0
            h = h+1
            matches(h,:) = TRI(i,:);
        end
    end
    newTrian = [trian; matches];
else 
  [e, ~] = ind2sub(size(trian), find((trian == center)~=0))
  
  newTrian(e,:) = [];
       
end



length(newTrian(:,1))
