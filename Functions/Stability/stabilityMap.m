
%%%LLamo a la triangulacion: vortices_1074_1tri.xls
function Media = stabilityMap( posicion, triangulacion)

Dist_angu=size(posicion);
Mapa_pos=ones(length(posicion(:,1)),13)-1;
Mapa_ang=ones(length(posicion(:,1)),13)-1;
%Voy cogiendo cada dato de la triangulacion:
for i=1:length(triangulacion(:,1))
  
    vortice1=triangulacion(i,1);
    vortice2=triangulacion(i,2);
    vortice3=triangulacion(i,3);
    
    v(i,:)=[vortice1 vortice2 vortice3];
 
    vertice1=posicion(vortice1,:);
  
    vertice2=posicion(vortice2,:);
    vertice3=posicion(vortice3,:);
    
    Distance1=sqrt((vertice1(1)-vertice2(1))^2+(vertice1(2)-vertice2(2))^2);
     Distance2=sqrt((vertice2(1)-vertice3(1))^2+(vertice2(2)-vertice3(2))^2);
    Distance3=sqrt((vertice3(1)-vertice1(1))^2+(vertice3(2)-vertice1(2))^2);
    
    if Mapa_pos(vortice1,1)==0
      Mapa_pos(vortice1,1:2)=[Distance1 Distance3];  
    else
  
    Mapa_pos(vortice1,(find(Mapa_pos(vortice1,:)~=0,1,'last')+1):(find(Mapa_pos(vortice1,:)~=0,1,'last')+2))=[Distance1 Distance3];
    end

  
    
    if Mapa_pos(vortice2,1)==0
      Mapa_pos(vortice2,1:2)=[Distance1 Distance2];  
    else
       
    Mapa_pos(vortice2,(find(Mapa_pos(vortice2,:)~=0,1,'last')+1):(find(Mapa_pos(vortice2,:)~=0,1,'last')+2))=[Distance1 Distance2]; 
    end
    


   
    if Mapa_pos(vortice3,1)==0
       
      Mapa_pos(vortice3,1:2)=[Distance2 Distance3];
   
    else
       
        
    Mapa_pos(vortice3,(find(Mapa_pos(vortice3,:)~=0,1,'last')+1):(find(Mapa_pos(vortice3,:)~=0,1,'last')+2))=[Distance2 Distance3];
    end
    

    Angulo1=180*acos((Distance1^2+Distance3^2-Distance2^2)/(2*Distance1*Distance3))/pi;
    
    if Mapa_ang(vortice1,1)==0
      Mapa_ang(vortice1,1)=Angulo1;  
    else
    Mapa_ang(vortice1,find(Mapa_ang(vortice1,:)~=0,1,'last')+1)=Angulo1;
    end
    
    Angulo2=180*acos((Distance1^2+Distance2^2-Distance3^2)/(2*Distance1*Distance2))/pi;
    
    if Mapa_ang(vortice2,1)==0
      Mapa_ang(vortice2,1)=Angulo2;  
    else
    Mapa_ang(vortice2,find(Mapa_ang(vortice2,:)~=0,1,'last')+1)=Angulo2;
    end
    
    Angulo3=180*acos((Distance3^2+Distance2^2-Distance1^2)/(2*Distance3*Distance2))/pi;
    
     if Mapa_ang(vortice3,1)==0
      Mapa_ang(vortice3,1)=Angulo3;  
    else
    Mapa_ang(vortice3,find(Mapa_ang(vortice3,:)~=0,1,'last')+1)=Angulo3;
     end

    
    
end




for i=1:length(posicion(:,1))
   
    Media_dist=Mapa_pos(i,1:length(find(Mapa_pos(i,:)~=0)));

    Media_ang=Mapa_pos(i,1:length(find(Mapa_ang(i,:)~=0)));
        for lll=1:length(Media_dist)
           
         if Media_dist(lll)<30 ||Media_dist(lll)>90
%         
             Media_dist(lll)=90;
          end
        end
    for ll=1:length(Media_ang)
           
         if Media_ang(ll)<30 ||Media_ang(ll)>90
%         
             Media_ang(ll)=90;
         end
    end
   % if length(Media_dist)>=1 && length(Media_ang)>=1
     Media(i,:)=[posicion(i,:) mean(Media_dist) std(Media_dist) mean(Media_ang) std(Media_ang)]; 
     vecinos(i,1)=length(find(v==i));
    
    %else
      %  posicion(i,:)=[];
   % end


end







     kk=0;

     for nn=1:length(Media(:,3))
         if Media(nn,3)<1000 && Media(nn,3)>20
             kk=kk+1;
             mm(kk)=Media(nn,3);
             kk
         end
     end
     1
       mmm=mean(mm);
       Media(:,4)=Media(:,4)/mmm;
       
       
          kk=0;
   clear mm
   %   h2=figure; 
   %set(h2, 'Units', 'centimeters','Position',[0 0 30 30]/2,'visible','off')

      for nn=1:length(Media(:,5))
         if Media(nn,5)<1000 && Media(nn,5)>20
             kk=kk+1;
             mm(kk)=Media(nn,5);
         end
     end
       mmm=mean(mm);
       Media(:,6)=Media(:,6)/mmm;
       
       a=figure(1);
       a.UserData.Media = Media;
       
       
       
end
