%It erases the triangles you clicked.

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