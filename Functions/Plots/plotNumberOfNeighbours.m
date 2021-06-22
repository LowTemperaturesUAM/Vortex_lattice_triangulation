function plotNumberOfNeighbours(neighbours)
fig = openFigure('NumberOfNeighbours');

h = histogram(neighbours); 



%NumberOfBins = 10;
FontSizeNumbers     = 25;
FontSizeXYLabel    =  30; 
FontSizeTitle      = 30;
LineBoxWidth       = 2;     
Title        = 'Number of first neighbours';
XTitle       = 'Number of Neighbours';
YTitle       = 'Count';
ColorBins    = [0 0 1];
Transparency = 0.6;
Font         ='arial';
LimitX       = [-inf inf];
LimitY       = [-inf inf];


%%% Figure Properies
fig.WindowButtonMotionFcn = 'detectPointsInHistogram';

%%% Axes Properties
%axis(Limits)
fig.Children.XLim      = LimitX;
fig.Children.YLim      = LimitY;

fig.Children.FontSize = FontSizeNumbers;
fig.Children.FontName     = Font;

fig.Children.XLabel.String   = XTitle;
fig.Children.XLabel.FontSize = FontSizeXYLabel;

fig.Children.YLabel.String   = YTitle;
fig.Children.YLabel.FontSize = FontSizeXYLabel;

fig.Children.Title.String    = Title;
fig.Children.Title.FontSize = FontSizeTitle ;

fig.Children.LineWidth            = LineBoxWidth;
axis square;
%%% Histogram Properties

%h.NumBins   = NumberOfBins;
h.FaceColor = ColorBins;
h.FaceAlpha = Transparency;

