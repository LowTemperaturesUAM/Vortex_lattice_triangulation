%To open only one figure with same name
function fig = openFigure(Name)

if isempty(findobj('Name', Name))
    
    fig = figure('Name',Name);
else
    delete(findobj('Name',Name))
    fig = figure('Name',Name);
end