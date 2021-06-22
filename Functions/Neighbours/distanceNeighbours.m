function [distances, realPairs] = distanceNeighbours(allow, centrosc, trian)



pares = [trian(:,1) trian(:,2); trian(:,2) trian(:,3); trian(:,2) trian(:,3)];
pares = unique(pares, 'rows');

distances = 0;
j = 0;
for i=1:length(pares)
 
        if sum(pares(i,1) == allow) && sum(pares(i,2) == allow)
            j = j+1;

            distances(j)     = pdist([centrosc(pares(i,1),:); centrosc(pares(i,2),:)]);
            realPairs(j,1:2) = pares(i,:);
%             if distances(j) >15
%                 pares(i,:)
%                 
%                 [centrosc(pares(i,1),:); centrosc(pares(i,2),:)]
%                 pause
%             end
        end
end

