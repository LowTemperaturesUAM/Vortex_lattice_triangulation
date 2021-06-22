function paintWithVoronoi(Values, Map, centros, trian, allow)


 ValuesNew = round(255.*(Values(:,4)+1));  
 
 color = jet(max(ValuesNew));
  openFigure('DistanceMap')
imshow(Map)
hold on
triplot(trian, centros(:,1), centros(:,2), 'w')
hold on;plot(centros(:,1), centros(:,2), 'w.')

for i=1:length(allow)
    
    vertices = surroundingPoints(allow(i), trian);
    
   Vertices = [centros(vertices,1) centros(vertices,2)];

    N = orderVertices(Vertices,centros(allow(i),:));
    
    f = length(N);


        a = patch('Faces', 1:f, 'Vertices', N', 'FaceVertexCData',Values(i,4) ,'FaceAlpha',.7, 'EdgeColor', 'none',...
        'FaceColor','flat');
    
   
    
    
end


colorbar

color = [ ((linspace(0.2,0,256)).^(1/2))', ((linspace(0.2,0,256)).^(1/2))',  ((linspace(1,0,256)).^(1/2))'];
colormap(color)

ValuesNew = round(255.*(Values(:,5)+1));  
 
  openFigure('AngleMap')
imshow(Map)
hold on
triplot(trian, centros(:,1), centros(:,2), 'w')
plot(centros(:,1), centros(:,2), 'w.')

for i=1:length(allow)
    
    vertices = surroundingPoints(allow(i), trian);
    
   Vertices = [centros(vertices,1) centros(vertices,2)];
  
    N = orderVertices(Vertices,centros(allow(i),:)  );
    
    f = length(N);


   % a = patch('Faces', 1:f, 'Vertices', N', 'FaceColor', color(ValuesNew(i),:),'FaceAlpha',.8, 'EdgeColor', 'none');
   
    a = patch('Faces', 1:f, 'Vertices', N', 'FaceVertexCData',Values(i,5) ,'FaceAlpha',.7, 'EdgeColor', 'none',...
        'FaceColor','flat');
   
end



color = [ ((linspace(0.2,0,256)).^(1/2))', ((linspace(0.2,0,256)).^(1/2))',  ((linspace(1,0,256)).^(1/2))'];
colormap(color)
colorbar

