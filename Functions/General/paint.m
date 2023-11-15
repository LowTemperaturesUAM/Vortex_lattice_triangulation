%It paints the centroids the triangulation and if it is given the number of
%neighgbour of each vortex with a different color. It only takes in account
%the one in the allow list.
%Green < 6
%Blue = 6
%White >6

function paint(Imagen, centrosc, trian, allow, neighbours)
                %2
                %Este dos queda aqui comentado. Antaño cada vez que hacias
                %algo con este programa ese dos salia en la ventana de
                %comandos y nadie sabia porque. Despues de 2 horas de 
                %investigacion y diseccion del programa lo hemos
                %encontrado y se queda aqui para que las generaciones del
                %futuro disfruteis tambien de su existencia. Besis


                %Aqui la funcion busca los ejes y pinta el espectro 
                %y los triangulitos que pintan la red. 
                fig = findobj('Number', 1   );
                cla(fig.Children)
                imshow(Imagen);
                %src.Units = 'normalized';
                %   src.OuterPosition = [0 0 1 1];
                hold on
                triplot(trian,centrosc(:,1), centrosc(:,2), 'w');        
                labels = cellstr( num2str([1:length(centrosc(:,1))]' ));    
                
                %Aqui tenemos dos opciones si solo pasas tres variables
                %(vease Imagen, centrosc y trian) te pinta la posicion de
                %los vortices sobre la red y el espectro y ya
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


                %Si por otro lado tambien le pasas la lista de los
                %allowed y del número de vecinos te pinta solo los
                %allowed con distinto color dependiendo de cuantos vecinos
                %tenga el vortice
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