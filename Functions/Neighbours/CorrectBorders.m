
function [allowed, forbidden] = CorrectBorders(centroids, centro, click, allowed, forbidden)

    for i=1:length(centroids)
        distancia(i) = pdist([centroids(i,:); centro]);
      
    end
      [~, minimo] = min(distancia);
if strcmp(click, 'normal')
   allowed = [allowed minimo];
   length(forbidden)
   for i =1:length(forbidden)
       i
       forbidden(i)
       if minimo == forbidden(i)
           
           forbidden(i) = [];
           disp('found!')
           break
           
       end
   end
    disp('found!')
   allowed = unique(allowed);
   forbidden = unique( forbidden);
 

else
     disp('forbid')
     length(allowed)
    forbidden = [forbidden minimo]; 
    
       for i =1:length(allowed)
           if minimo == allowed(i)
               allowed(i) = [];
              break
               
           end
       end
    allowed = unique(allowed);
    forbidden = unique( forbidden);
    
end
