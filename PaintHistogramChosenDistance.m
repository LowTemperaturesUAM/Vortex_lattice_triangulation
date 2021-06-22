figure(10)
hold off
imshow(a.Map)
hold on


%% Pico 1

LimInf = 0.4281 - 1.5*0.05129;
LimSup = 0.4281 + 1.5*0.05129;
indices = find(a.distance <= LimSup & a.distance >=LimInf);

for h =1:length(indices)
    
        pairXY = [a.centrosc(a.pairs(indices(h), 1),:); a.centrosc(a.pairs(indices(h), 2),:)];
       angle1(h) =  atand((pairXY(2,2)-pairXY(1,2))/(pairXY(2,1)-pairXY(1,1)));
        

        
%        if angle1(h) <0
%              angle1(h) = angle1(h) + 90;
%         end
%         if angle1(h) >70
%             angle1(h) = angle1(h) -90;
%         end        
        
        b = plot( pairXY(:,1), pairXY(:,2), '-', 'MarkerSize', 13, 'LineWidth',2, 'Color', [163 25 52]./256);
end

%% Pico 2

LimInf = 0.575 - 1.5*0.02896;
LimSup = 0.575 + 1.5*0.02896;
indices = find(a.distance <= LimSup & a.distance >=LimInf);

for h =1:length(indices)
    
        pairXY = [a.centrosc(a.pairs(indices(h), 1),:); a.centrosc(a.pairs(indices(h), 2),:)];

               angle2(h) =  atand((pairXY(2,2)-pairXY(1,2))/(pairXY(2,1)-pairXY(1,1)));
%         if angle2(h) <0
%              angle2(h) = angle1(h) + 90;
%         end
%         
%        if angle2(h) >80 &&  angle2(h) <120
%             angle1(h) = angle1(h) -90;
%         end 
        %         v1 = [pairXY(1,:) 0];
%         v2 = [pairXY(2,:) 0];
%         
%         angle2(h) = atan2d(norm(cross(v1,v2)), dot(v1,v2));
         b = plot( pairXY(:,1), pairXY(:,2), 'b-', 'MarkerSize', 13, 'LineWidth',2, 'Color', [0 114 189]./256);
end

hold on
plot(a.centrosc(:,1), a.centrosc(:,2), '.')