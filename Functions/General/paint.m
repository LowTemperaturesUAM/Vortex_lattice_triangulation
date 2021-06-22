%It paints the centroids the triangulation and if it is given the number of
%neighgbour of each vortex with a different color. It only takes in account
%the one in the allow list.
%Green < 6
%Blue = 6
%White >7

function paint(Imagen, centrosc, trian, allow, neighbours)
                2
                fig = findobj('Number', 1   );
                cla(fig.Children)
                
                imshow(Imagen);
                %src.Units = 'normalized';
                %   src.OuterPosition = [0 0 1 1];
                hold on
 
   
                    triplot(trian,centrosc(:,1), centrosc(:,2), 'w');
                    
                    
                        
                    labels = cellstr( num2str([1:length(centrosc(:,1))]' ));    
                if nargin ==3
                
%                     h = 0;
%                     for i = 1:length(centrosc(:,1))
%                         
%                         if centrosc(i,1) ==0 && centrosc(i,2) ==0
%                         else
%                             h= h+1;
%                             centrosfilt(h,:) = centrosc(i,:);
%                             labelsfilt{h} = labels{i};
%                         end
%                     end
%   
%                  plot(centrosfilt(:,1),centrosfilt(:,2),'w.','MarkerSize',7, 'MarkerFaceColor', 'w') 
%                 text(centrosfilt(:,1), centrosfilt(:,2), labelsfilt, 'VerticalAlignment','bottom', ...
%                 'HorizontalAlignment','right', 'EdgeColor','yellow')
                 plot(centrosc(:,1),centrosc(:,2),'r.','MarkerSize',20, 'MarkerFaceColor', 'b') 
%                 text(centrosc(:,1), centrosc(:,2), labels, 'VerticalAlignment','bottom', ...
%                 'HorizontalAlignment','right', 'EdgeColor','yellow')
                elseif nargin==5
                    
                    
                    for i = 1:length(allow)
                        if neighbours(i) < 6
                            plot(centrosc(allow(i),1),centrosc(allow(i),2),'go','MarkerSize',7, 'MarkerFaceColor', 'g') 
                        elseif neighbours(i) == 6
                            plot(centrosc(allow(i),1),centrosc(allow(i),2),'bo','MarkerSize',7, 'MarkerFaceColor', 'b') 
                        else
                            plot(centrosc(allow(i),1),centrosc(allow(i),2),'wo','MarkerSize',7, 'MarkerFaceColor', 'w') 
                        end
                    end
%                     
%                  text(centrosc(:,1), centrosc(:,2), labels, 'VerticalAlignment','bottom', ...
%                 'HorizontalAlignment','right', 'EdgeColor','yellow')
                end