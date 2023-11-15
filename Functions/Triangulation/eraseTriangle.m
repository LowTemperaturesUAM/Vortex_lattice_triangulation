%It erases the triangles you clicked.
%Pd: no lo hace lol (bueno tiene truco)

%Cuando borras un triangulo no se ve reflejado en la figura ya que los 
%triangulos contiguos con los que comparte lados siguen existiendo. 
%Para borrar una linea debes borrar todos los triangulos que la compartan 

function [NewTriangulation unwanted] = eraseTriangle(center, Triangulation, centroids)
        unwanted =  [];
        NewTriangulation = Triangulation;
        for a=1:length(Triangulation(:,1))
       
            b=isPointInTriangle(center,centroids(Triangulation(a,1),:),centroids(Triangulation(a,2),:),...
                                centroids(Triangulation(a,3),:));
        
                if b==1
                    disp('found!')
                    unwanted = NewTriangulation(a,:);
                    NewTriangulation(a,:)=[];
                    break

                end
       
        end