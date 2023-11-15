%It recalculates the triangulation of the new set of positions.

function newTrian = reTriangV2(centroids, unwanted)
disp('entro')

TRI = delaunay(centroids(:,1), centroids(:,2));


if unwanted>0
for i = 1:size(unwanted,1)


    test = TRI  == unwanted(i,:);
    match = test(:,1).*test(:,2).*test(:,3);
    toErase = nonzeros((1:length(match))'.*match);
    
     TRI(toErase,:) = [];

end
end


newTrian = TRI;

% numtri = size(TRI,1);
% a0 = 55.2;
% f = 300;
% newTrian= [];
% 
% for i = 1: numtri
% d12(i) = sqrt((centroids(TRI(i,1),1)-centroids(TRI(i,2),1))^2+(centroids(TRI(i,1),2)-centroids(TRI(i,2),2))^2);
% d13(i) = sqrt((centroids(TRI(i,1),1)-centroids(TRI(i,3),1))^2+(centroids(TRI(i,1),2)-centroids(TRI(i,3),2))^2);
% d23(i) = sqrt((centroids(TRI(i,2),1)-centroids(TRI(i,3),1))^2+(centroids(TRI(i,2),2)-centroids(TRI(i,3),2))^2);
% 
%  if ((d12(i)<f*a0).*(d13(i)<f*a0).*(d23(i)<f*a0)==1)
%         newTrian = [newTrian; TRI(i,:)];    
%  end

end



