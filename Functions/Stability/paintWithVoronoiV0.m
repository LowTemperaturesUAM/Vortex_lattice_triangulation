function paintWithVoronoiV0(Values, Map, centros, trian)


[v,c] = voronoin(centros);
[tamx, tamy, ~] = size(Map);
j = 0;
for i = 1:length(v)
   
    if sum(abs(v(i,:))> [tamx, tamy]) >0 ||  sum((v(i,:))<= [0, 0]) >0
         j= j+1;
        forbid(j) = i;

    end
end


h = 0;
for i = 1:length(c)
    for j = 1:length(c{i})
        if all(forbid ~= c{i}(j))
           flag =1;
        else
            flag = 0;
            break
        end
    end
    if flag
        h = h+1;
        cnew{h} = c{i};
    end
end

%%%%% Distance          
 %ValuesNew = round(rescale(Values(:,3),1, 256)); 
 ValuesNew = round(255.*(Values(:,4)+1));   

for i = 1: length(ValuesNew)
    if isnan(ValuesNew(i))
        ValuesNew(i) =1;
    end
end
 color = parula(max(ValuesNew));
 openFigure('DistanceMap')
imshow(Map)
hold on;plot(centros(:,1), centros(:,2), 'w.')
%triplot(delaunay(centros(:,1), centros(:,2)), centros(:,1), centros(:,2))
triplot(trian, centros(:,1), centros(:,2), 'w')
length(cnew)
for i = 1:length(cnew)
if all(cnew{i}~=1)  % If at least one of the indices is 1,
% then it is an open region and we can't
% patch that.

        % ind = cnew{i}';
        %tess_area(i,1) = polyarea( v(ind,1) , v(ind,2) );
       
        i
        length(ValuesNew)
        length(cnew)
        ValuesNew(i)
        color(ValuesNew(i),:)
        patch(v(cnew{i},1),v(cnew{i},2),color(ValuesNew(i),:), 'FaceAlpha', 0.7); % use color i.
        pause
end
end

%%%%% Angle        
 %ValuesNew = round(rescale(Values(:,5),1, 256)); 
  ValuesNew = round(255.*(Values(:,5)+1))
 color = parula(max(ValuesNew));
 openFigure('AngleMap')
imshow(Map)
for i = 1: length(ValuesNew)
    if isnan(ValuesNew(i))
        ValuesNew(i) =1;
    end
end
hold on;plot(centros(:,1), centros(:,2), 'w.')
%triplot(delaunay(centros(:,1), centros(:,2)), centros(:,1), centros(:,2))
triplot(trian, centros(:,1), centros(:,2), 'w')



for i = 1:length(cnew)
if all(cnew{i}~=1)  % If at least one of the indices is 1,
% then it is an open region and we can't
% patch that.

        % ind = cnew{i}';
        %tess_area(i,1) = polyarea( v(ind,1) , v(ind,2) );
        patch(v(cnew{i},1),v(cnew{i},2),color(ValuesNew(i),:), 'FaceAlpha', 0.7); % use color i.
end

end