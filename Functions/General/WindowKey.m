    function WindowKey(src, event)
   
            if strcmp(event.Key, 't')
                src.Children.Title.String = 'Triangulation Mode';
                src.UserData.Mode = 't';
        
            end
            
           if strcmp(event.Key, 'c')

                src.Children.Title.String = 'Centroids Mode';
                src.UserData.Mode = 'c';
        
           end
           
           if strcmp(event.Key, 'rightarrow')
               1
               Frame = src.UserData.Frame;
               NFrames = src.UserData.NumberOfImages;
               
                src.Children.Title.String = 'Follow Mode';
                src.UserData.Mode = 'f';
                 openFrame(1)
                
        
           end
           
            if strcmp(event.Key, 'leftarrow')
                src.Children.Title.String = 'Follow Mode';
                src.UserData.Mode = 'f';
                 openFrame(0)
        
           end
           
           

        
      
          end