function detectPointsInHistogram()

Fig = findobj('Name', 'NumberOfNeighbours') ;
Puntero = Fig.Children.CurrentPoint;

PunteroX = Puntero(1);
PunteroY = Puntero(1,2);
User = Fig.Children.UserData;
if isfield(User, 'PunteroXOld' )
    if Fig.Children.UserData.PunteroXOld ~= PunteroX && ...
       Fig.Children.UserData.PunteroYOld ~= PunteroY 
        
        FigImage = findobj('Name', 'Image');
        Fig.Children.UserData.PunteroXOld = PunteroX;
        Fig.Children.UserData.PunteroYOld = PunteroY;
        delete(findobj('Tag','Histograma'));
%Detecto los limites del histograma

        X     = Fig.Children.Children.BinEdges;
        Width = Fig.Children.Children.BinWidth;
        Y = Fig.Children.Children.Values;
        closest = 0;
        if PunteroX>X(1) && PunteroX< X(end)

            [~, closest] = min(abs(PunteroX - X(1:end-1) - Width/2));

            if PunteroY < Y(closest) && PunteroY>0

                %disp(['You are in bin: ', num2str(closest)])
            else
                closest = 0;
            end
        end

        
         hold on   
        neighbour = FigImage.UserData.neighbour;
        allow = FigImage.UserData.allow;
       
        centroids = FigImage.UserData.centrosc;
        

        if closest >0

        indices = find(neighbour>X(closest) & neighbour<X(closest +1));
        indices = allow(indices);
        b = plot(FigImage.Children, centroids(indices,1), centroids(indices,2), 'ro', 'MarkerSize', 13, 'LineWidth',2);
        b.Tag ='Histograma';
        

        end
        
    end

else
     
        Fig.Children.UserData.PunteroXOld = PunteroX;
        Fig.Children.UserData.PunteroYOld = PunteroY;
end




    



