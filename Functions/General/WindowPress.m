   function WindowPress(src, event)
               x= src.Children.CurrentPoint(1,1);
               y= src.Children.CurrentPoint(1,2);
               newcenter=[x y];    
               centrosc = src.UserData.centrosc;      
               trian = src.UserData.trian;   

    switch src.UserData.Mode
        case {'c', 'f'}
       
                 
               if ~isfield(src.UserData, 'UnwantedTrian')
                   src.UserData.UnwantedTrian = [];
               end
              
               [centrosc, trian]  = CorrectVortices(centrosc, newcenter, src.SelectionType, trian, src.UserData.UnwantedTrian);
            
                src.UserData.centrosc = centrosc;
                src.UserData.trian = trian;
                
             

            paint(src.UserData.Map, centrosc, trian)
        case 't'
                             
               if ~isfield(src.UserData, 'UnwantedTrian')
                   src.UserData.UnwantedTrian = [];
               end
            
             [trian, unwanted] = eraseTriangle(newcenter, trian, centrosc);
             src.UserData.trian = trian;
             
                src.UserData.UnwantedTrian = [src.UserData.UnwantedTrian; unwanted];
          
             
            paint(src.UserData.Map, centrosc, trian)
        
        case 'n'
            
             [allowed, forbidden] = CorrectBorders(src.UserData.centrosc,  newcenter, src.SelectionType, src.UserData.allowed, src.UserData.forbidden);
             src.UserData.allowed = allowed;
             src.UserData.forbidden = forbidden;
             allow = allowCalculation(src.UserData.centrosc, src.UserData.allowed,src.UserData.forbidden,...
                                         src.UserData.IndiceBorder, src.UserData.Map);
             src.UserData.allow = allow;
             neighbours = numberOfNeighbours(src.UserData.allow, src.UserData.trian);     
             src.UserData.neighbour = neighbours;
                                     
             paint(src.UserData.Map,src.UserData.centrosc, src.UserData.trian, src.UserData.allow, src.UserData.neighbour)
             
    end
        
     end