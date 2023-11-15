function neighbour = surroundingPoints(point, trian)


%Te saca un array con los indices de los vecinos (once again hazte un dibujo)
    
    [number, ~] = ind2sub(size(trian),find(point==trian));
    
    nn= trian(number,:);
    neighbour = unique(nonzeros(nn-point)) +point;
