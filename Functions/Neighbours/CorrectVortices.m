%This function adds the vortex you click normal to the list of position of
%vortices and removes the one you click right.

function [centroidsNew newTrian] = CorrectVortices(centroids, centro, click, trian,unwanted)
centroidsNew = centroids;
if strcmp(click, 'normal')
    centroidsNew = [centroids; centro];
    newTrian = reTriangV2(centroidsNew, unwanted);
   
else
    for i=1:length(centroids)
        distancia(i) = pdist([centroids(i,:); centro]);
    end
    [~, minimo] = min(distancia);
  
    centroidsNew(minimo,:) = [ ]; %en principio esto funciona pero si no vuelve a poner [0 0] si no funciona
    newTrian = reTriangV2(centroidsNew, unwanted);
    
end
