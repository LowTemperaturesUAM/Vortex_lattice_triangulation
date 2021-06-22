function neighbour = surroundingPoints(point, trian)



    
    [number, ~] = ind2sub(size(trian),find(point==trian));
    
    nn= trian(number,:);
    neighbour = unique(nonzeros(nn-point)) +point;
