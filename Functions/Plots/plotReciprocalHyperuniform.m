function plotReciprocalHyperuniform(Space, PerfilRadial)
      
     fig = openFigure('ReciprocalHyperuniform');
      plot(Space,  PerfilRadial, 'o-');
    
FontSizeNumbers     = 25;
FontSizeXYLabel    =  30; 
FontSizeTitle      = 30;
LineBoxWidth       = 2;     
Title        = 'Reciprocal Hyperuniform';
XTitle       = 'k (nm^-^1)';
YTitle       = 'S(k)';
Font         = 'arial';
LimitX       = [-inf inf];
LimitY       = [-inf inf];

grid on

%%% Figure Properies

%%% Axes Properties

fig.Children.XLim      = LimitX;
fig.Children.YLim      = LimitY;
fig.Children.XScale    = 'log';
fig.Children.YScale    = 'log';

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
     