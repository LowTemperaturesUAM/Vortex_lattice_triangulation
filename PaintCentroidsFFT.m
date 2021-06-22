%% Plot centroids
DistanciaFilas = InfoStruct.DistanciaFilas;
DistanciaColumnas = InfoStruct.DistanciaColumnas;

Filas = length(DistanciaFilas);
Columnas = length(DistanciaColumnas);

DistanciaFourierFilas = InfoStruct.DistanciaFourierFilas;
DistanciaFourierColumnas = InfoStruct.DistanciaFourierColumnas;


fig = figure;
plot(a.centrosc(:,1),a.centrosc(:,2),'ko','MarkerSize',0.01,'MarkerFaceColor','k')
fig.Position = [0 0 512 512];
% axis square
b = fig.Children;
b.XLim = [0 size(a.Map,1)];
b.YLim = [0 size(a.Map,2)];
b.XAxis.Visible = 'off';
b.YAxis.Visible = 'off';
b.Position = b.OuterPosition;

Frame = getframe(fig);

Frame = imcomplement(rgb2gray(Frame.cdata));
Frame = imresize(Frame, [Filas Columnas]);
Frame = logical(Frame);
Frame = Frame*255;
delete(fig)

fig = figure;
imagesc(DistanciaColumnas,DistanciaFilas,Frame)
xlabel('Distance (nm)')
ylabel('Distance (nm)')
colormap gray
b=fig.Children;
b.YDir = 'normal';
b.LineWidth = 2;
b.TickDir = 'out';
b.FontName = 'arial';
b.FontWeight = 'bold';
b.FontSize = 12;
b.XColor = 'k';
b.YColor = 'k';
axis square

Transformada = fft2d(Frame);

fig = figure;
imagesc(DistanciaFourierColumnas,DistanciaFourierFilas,Transformada)
xlabel('q (nm^{-1})')
ylabel('q (nm^{-1})')
colormap gray
b=fig.Children;
b.YDir = 'normal';
b.LineWidth = 2;
b.TickDir = 'out';
b.FontName = 'arial';
b.FontWeight = 'bold';
b.FontSize = 12;
b.XColor = 'k';
b.YColor = 'k';
b.XLim = [-0.5 0.5];
b.YLim = [-0.5 0.5];
b.CLim = [0 5e4];
axis square


%%
fig=gcf;
fig.Position = [1047,232,579,478];