%%%LLamo a la triangulacion: vortices_1074_1tri.xls
function Media = stabilityMapV2( centros, trian, allow)
    
for i=1:length(allow)
    
    %%%Calculate each distance
     neighbours = surroundingPoints(allow(i), trian);
     distance   = distance1ToNPoint(centros(allow(i),:), centros(neighbours,:));
     
     %%%Calculate each angle
     angle = calculateAngle(allow(i), centros, trian);
    
     
     Media(i,:) = [allow(i) mean(distance),  mean(angle)];
    
end

Media(:,4) = abs(Media(:,2) - mean(Media(:,2) ))./mean(Media(:,2))
disp('Termina')
Media(:,5) = abs(Media(:,3)-60)/mean(Media(:,3))
                   

         
     
     
     