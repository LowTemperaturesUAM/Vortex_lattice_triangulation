%This function adds the vortex you click in the allowed list. IT ONLY ADDS.
function allow = allowCalculation(centrosc, allowed, forbidden, indice, X)
 
 a0 = 50;
 hold on
 h = 0;
 [Xmax, Ymax, ~] = size(X);
   for i=1:length(centrosc(:,1))
     
       if (((centrosc(i,1)>=indice*a0 && centrosc(i,2)>=indice*a0) && (centrosc(i,1)<=Ymax-indice*a0...
               && centrosc(i,2)<=Xmax-indice*a0)) || sum(i==allowed) == 1) && sum(i==forbidden) == 0

           h = h+1;
           
           allow(h) = i;    
      
       end
   end
   allow = unique(allow);