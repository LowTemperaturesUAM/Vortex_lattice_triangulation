%% CALCULAMOS EL NÚMERO DE PUNTOS EN LOS CIRCULOS sin solape
%nPuntosRadio:  Numero de puntos para el radio de la circunferencia
%Nmuestras:Numero de circulos con el mismo radio para la estadística
%spacing: distancia media entre puntos

function Varia = HyperuniformityReal(randomCentroidsCartesian, ZeroBias, nPuntosRadio, maxR, Fig)


for repeticiones = 1:100
    repeticiones
tam = length(ZeroBias);

Fig

Mapa = findobj(Fig, 'Type', 'Image')
%Ya tengo la matriz de imagen
Ima = Mapa.CData;
[Xold Yold, ~ ] = size(Ima);


%Recorto la matriz a los limites recortados con el programa pero siempre
%tiene que ser cuadrada asi que recorto con el tamaño maximo


XLim = Mapa.Parent.XLim;

YLim = Mapa.Parent.YLim;

indicesCentroidsOriginal = randomCentroidsCartesian; 
indicesCentroidsReal= [0 0];
m = 0;
indicesCentroidsOriginal(:,1) = (randomCentroidsCartesian(:,1) - XLim(1) + 0.5 + 1);
indicesCentroidsOriginal(:,2) = (randomCentroidsCartesian(:,2) - YLim(1) + 0.5 + 1);
tamanhoImagen = [round(XLim(2) - XLim(1)), round(YLim(2) - YLim(1))];
  for i = 1:length(indicesCentroidsOriginal)
      if indicesCentroidsOriginal(i,1)<0 || indicesCentroidsOriginal(i,1)>tamanhoImagen(1)...
              || indicesCentroidsOriginal(i,2)<0 || indicesCentroidsOriginal(i,2)>tamanhoImagen(2)
         
      else
          m = m+1;
          indicesCentroidsReal(m,:) = indicesCentroidsOriginal(i,:);
      end
  end
  randomCentroidsCartesian = indicesCentroidsReal;
tam = tamanhoImagen(1);
spacing      =  tam/sqrt(pi*length(randomCentroidsCartesian));

Radio = linspace(0, maxR*tam,nPuntosRadio)./spacing;
NmuestrasT    = round(0.8*length(randomCentroidsCartesian));
%Nmuestras = 5;
Iteraciones  = 1;
%Npuntos = zeros(Nmuestras,nPuntosRadio);
Results = zeros(Iteraciones, 3);

for k=1:Iteraciones
  
h = 0;
for R = linspace(0.01, maxR*tam,nPuntosRadio)
    h = h +1;
    %disp([Iteraciones - k, nPuntosRadio - h])
    %disp(R)
    alphaNew =0;
    alphaMean =0;
    Nmuestras = floor(0.5*(2*R- tam)^2/(pi*R^2));

    if Nmuestras > NmuestrasT
        Nmuestras = NmuestrasT;
    end

    %disp([Nmuestras,  R/spacing]);
 
    
    Center = hardSphere(Nmuestras, tam-R, R, R,0);
    
   for i = 1:Nmuestras
        %Origen: Solo coge puntos dentro de una ventana, que su tamaño
        %varia con el radio de la circunferencia para que como mucho de al
        %borde de los margenes.
        %Center = length(ZeroBiasCut).*((1 - 2*R/length(ZeroBiasCut)) *(rand(1,2)) + R/length(ZeroBiasCut));
        alpha        = sum((((Center(i,1)-randomCentroidsCartesian(:,1)).^2 + (Center(i,2)-randomCentroidsCartesian(:,2)).^2)<R^2));
      if R/spacing >=1 && alpha ==0
         
      end
        alphaNew     = ((i-1)*alphaNew + alpha^2)/i; 
        alphaMean    = ((i-1)*alphaMean + alpha)/i;  
   end
   cuaN(h) = alphaNew;
   Ncua(h) = alphaMean^2;
  % disp(alphaMean);

end

Varia     = cuaN - Ncua;

end

Varia1(repeticiones,:) = Varia + 0.00001.*rand(length(Varia),1)';
%Varia
end
Varia = mean(Varia1);
Porcen = 0.01;
PorcenF = 0.48;
X = Radio(round(Porcen*(length(Radio))):round(PorcenF*(length(Radio))));
Y =Varia(round(Porcen*(length(Varia))):round(PorcenF*(length(Varia)))) ;


 a= reducedNoise(2,X, Y);
 X = a(:,1);
 Y = a(:,2);
% X = Radio(round(Porcen*end):round(PorcenF*end));
% %Y =cuadradoN(round(Porcen*end):end)- Ncuadrado(round(Porcen*end):end);
% Y = Varia(round(Porcen*end):round(PorcenF*end));
pO = exponentCalculator(X, (Y), 1);
%disp(pO)
Results(k+ 1,1:3) = mean(Results,1);