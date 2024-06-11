function WindowPress(src, ~)
x= src.Children.CurrentPoint(1,1);
y= src.Children.CurrentPoint(1,2);
realx = x/size(src.UserData.Map,1);
realy = y/size(src.UserData.Map,2);
chkIn =  (realx>=0 && realx<=1) && (realy>=0 && realy<=1);
if chkIn
    newcenter=[x y];
    centrosc = src.UserData.centrosc;
    trian = src.UserData.trian;

    switch src.UserData.Mode
        case {'c', 'f'} %center and follow mode


            if ~isfield(src.UserData, 'UnwantedTrian')
                src.UserData.UnwantedTrian = [];
            end

            [centrosc, trian]  = CorrectVortices(centrosc, newcenter, ...
                src.SelectionType, trian, src.UserData.UnwantedTrian);

            src.UserData.centrosc = centrosc;
            src.UserData.trian = trian;



            paint(src.UserData.Map, centrosc, trian)
        case 't' %triangulation  mode

            if ~isfield(src.UserData, 'UnwantedTrian')
                src.UserData.UnwantedTrian = [];
            end

            [trian, unwanted] = eraseTriangle(newcenter, trian, centrosc);
            src.UserData.trian = trian;

            src.UserData.UnwantedTrian = [src.UserData.UnwantedTrian; unwanted];


            paint(src.UserData.Map, centrosc, trian)

        case 'n' %general case. no mode engaged

            [allowed, forbidden] = CorrectBorders(src.UserData.centrosc,...
                newcenter, src.SelectionType, src.UserData.allowed, src.UserData.forbidden);
            src.UserData.allowed = allowed;
            src.UserData.forbidden = forbidden;
            allow = allowCalculation(src.UserData.centrosc, ...
                src.UserData.allowed,src.UserData.forbidden,...
                src.UserData.IndiceBorder, src.UserData.Map);
            src.UserData.allow = allow;
            neighbours = numberOfNeighbours(src.UserData.allow, src.UserData.trian);
            src.UserData.neighbour = neighbours;

            paint(src.UserData.Map,src.UserData.centrosc, ...
                src.UserData.trian, src.UserData.allow, src.UserData.neighbour)

    end

end
end