function angle = calculateAngle(number, centros, trian)

  
         [number,position] = ind2sub(size(trian),find(number==trian));
         angle = zeros(length(number),1);
        for j = 1:length(number)
            dist = pdist(centros(trian(number(j),:),:));
            switch position(j)
                case 1
                    angle(j) = 180*acos((dist(1).^2+dist(3).^2-dist(2).^2)./...
                                     (2*dist(1).*dist(3)))./pi;
                case 2
                     angle(j) = 180*acos((dist(2).^2+dist(3).^2-dist(1).^2)./...
                                     (2*dist(3).*dist(2)))./pi;
                case 3
                     angle(j) = 180*acos((dist(1).^2+dist(2).^2-dist(3).^2)./...
                                     (2*dist(1).*dist(2)))./pi;
            end
        end
            

            