function NewPoint = orderVertices(Vertices, center)
    
            
        [t, ~]= cart2pol((Vertices(:,1) - center(1)),(Vertices(:,2) - center(2)));
        t = 180.*t/pi;
        T = [t, [1:length(t)]']
        OrderMatrix = sortrows(T);
        order = OrderMatrix(:,2)';
        for i =1:length(order) -1
             NewPoint(:,i) = mean([center; Vertices(order(i),:);Vertices(order(i+1),:)] );
        end
            NewPoint(:,i+1) = mean([center; Vertices(order(i+1),:);Vertices(order(1),:)] );