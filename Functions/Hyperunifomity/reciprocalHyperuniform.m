function [Space, PerfilRadial]= reciprocalHyperuniform(Fig, centroids, realSize)
%Detecto la Image
Mapa = findobj(Fig, 'Type', 'Image');
%Ya tengo la matriz de imagen
Ima = Mapa.CData;
[Xold, Yold, ~ ] = size(Ima);
Ima = imresize(Ima, [512 512]);
X = 512;
Y = 512;
centroids = X.*centroids./Xold;
%Recorto la matriz a los limites recortados con el programa pero siempre
%tiene que ser cuadrada asi que recorto con el tamaño maximo

XOriginal = 1:X;
YOriginal = 1:Y;

XLim = Mapa.Parent.XLim;
XLim = X.*XLim./Xold;
YLim = Mapa.Parent.YLim;
YLim = Y.*YLim./Yold;
IndicesValidosX = XLim(1) < XOriginal & XLim(2) > XOriginal ;
IndicesValidosY = YLim(1) < YOriginal & YLim(2) > YOriginal ;

IndicesValidosX = nonzeros((1:X).*IndicesValidosX);
IndicesValidosY = nonzeros((1:Y).*IndicesValidosY);

ZeroBias = Ima(IndicesValidosX, IndicesValidosY,1);
%Hago la matriz binaria
tamanhoImagen = [round(XLim(2) - XLim(1)), round(YLim(2) - YLim(1))];
realSizeCut = tamanhoImagen.*realSize./[X Y];
LogicMatrix = zeros(tamanhoImagen(1), tamanhoImagen(2) );

%Se rellena la matriz
indicesCentroids = round(centroids) + 1;
indicesCentroidsOriginal = indicesCentroids;
%Se rellena LogicMatrix para discretizar

indicesCentroidsOriginal(:,1) = round(centroids(:,1) - XLim(1) + 0.5 + 1);
indicesCentroidsOriginal(:,2) = round(centroids(:,2) - YLim(1) + 0.5 + 1);
centroids(centroids(:,2)<0)
  indicesCentroidsOriginal(:,1)
  m = 0;
  indicesCentroidsReal=[0 0];

  for i = 1:length(indicesCentroidsOriginal)
      if indicesCentroidsOriginal(i,1)<0 || indicesCentroidsOriginal(i,1)>tamanhoImagen(1)...
              || indicesCentroidsOriginal(i,2)<0 || indicesCentroidsOriginal(i,2)>tamanhoImagen(2)
         
      else
          m = m+1;
          indicesCentroidsReal(m,:) = indicesCentroidsOriginal(i,:);
      end
  end
  m
  length(indicesCentroidsOriginal)
  indicesCentroidsOriginal = indicesCentroidsReal;
NIteraciones = 100;
PixelError   = 1;
NAnillos = 2;
TamanhoImagen = tamanhoImagen(1);
TamanhoFFT = TamanhoImagen;
tamanhoRealnm = realSize(1);

for h = 1:NIteraciones
    disp(NIteraciones - h)
    %Creo una imagen de ceros
LogicMatrix = zeros(TamanhoImagen,TamanhoImagen);
%Reescalamos al tamaño que queramos pasar la imagen
indicesCentroids = (indicesCentroidsOriginal) ...
                   + round(2*PixelError*rand(length(indicesCentroidsOriginal),2) -PixelError);

 indicesCentroids = indicesCentroids - 2*(indicesCentroids > TamanhoImagen);
 indicesCentroids = indicesCentroids + 2*(indicesCentroids < 0);
 indicesCentroids = indicesCentroids +   (indicesCentroids == 0);

%Se rellena LogicMatrix para discretizar
for i = 1: length(indicesCentroids(:,1))
        if indicesCentroids(i,1) > TamanhoImagen || indicesCentroids(i,2)> TamanhoImagen
        else
        LogicMatrix(indicesCentroids(i,2), indicesCentroids(i, 1)) = 1;
        end
    
end
% figure(12)
%         pcolor((LogicMatrix));
%         shading flat;
%         axis square;
%         set(gca,'XTick',[]);
%         set(gca,'YTick',[]);
%         caxis([0 1]);

 fftLogicMatrix = fft2d(LogicMatrix - mean(mean(LogicMatrix)));
 
 %%%%%%%%%%%%%%%%%%%%%%%%%Aproximo a 512 puntos en la FFT
%  TamanhoFFT = 512;
%  fftLogicMatrix =                    imresize(fftLogicMatrix, TamanhoFFT/TamanhoImagen,'Method', 'bilinear'); 
 fftLogicMatrix = fftLogicMatrix.^2;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 clear MediaRadial
%clear PerfilRadial

%Coordenadas Cartesianas

tamanhoReal =  tamanhoRealnm;
CordX = linspace(-1, 1, TamanhoFFT);
CordY = CordX;
CordX = meshgrid(CordX,CordX);
CordY = meshgrid(CordY,CordY);
CordY = CordY';

%Cambio a coordenadas polares
CordMod = sqrt(CordX.^2 + CordY.^2);
CordAng = atand(CordY./CordX);
   
%fftLogicMatrix = imresize(fftLogicMatrix, 4);
ValoresValidos = linspace(0,1,(TamanhoFFT/2)/NAnillos);
PerfilRadial = zeros(length(ValoresValidos) -1,1);
fftLogicMatrix = ((fftLogicMatrix - min(min(fftLogicMatrix)))/max(max(fftLogicMatrix)));
anillos        = zeros(TamanhoFFT, TamanhoFFT);

PerfilRadialv2 = zeros(length(ValoresValidos) -1,1);

for i =1:length(ValoresValidos) -1
   
    RadioValido  = CordMod >ValoresValidos(i) & CordMod <ValoresValidos(i +1);
    %Area         = (pi*(-ValoresValidos(i)^2 + ValoresValidos(i+1)^2));
  
    Area         = sum(sum(RadioValido))*(tamanhoRealnm/TamanhoImagen)^2;

    if h>1
        PerfilRadial(i) = (sum(sum(((fftLogicMatrix ).*RadioValido ))))/Area + PerfilRadialv1(i, h-1);
    
    else
   
         PerfilRadial(i) = (sum(sum(((fftLogicMatrix ).*RadioValido ))))/Area ;
         
     
    end
   
    anillos         = anillos + RadioValido*mod(i+5,5) ;
    
  
      PerfilRadialv1(i,h) = PerfilRadial(i);

end

PerfilRadial = PerfilRadial/h;

norm = mean(PerfilRadial(end - round(ValoresValidos/15):end));

PerfilRadial(:) = PerfilRadial/norm;

%PerfilRadialv2(:,h) = PerfilRadial;


end



    
 
     PixelMinimo = TamanhoImagen/(TamanhoFFT*tamanhoRealnm);

    Space = (linspace(PixelMinimo,  TamanhoFFT*PixelMinimo/2, length(PerfilRadial)));
        
    %Hermann = reducedNoise(1,Space', PerfilRadial)
 
    
     
  
     %Guardamos en un txt para tener los datos asi
     figure
        pcolor((fftLogicMatrix));
        shading flat;
        axis square;
        set(gca,'XTick',[]);
        set(gca,'YTick',[]);
        caxis([0 1]);
        
         anillos = anillos./norm;

% figure
% a = pcolor(anillos);
% a.EdgeColor ='none';
% colormap summer
% axis square
