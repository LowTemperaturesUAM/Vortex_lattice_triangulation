function [distances, realPairs] = distanceNeighbours(allow, centrosc, trian)


%Trian es un vector de tres columnas, cada elemento es un indice de
%centrosc correspondiente a un vortice. Cada fila es uno de los triangulos de la
%red. Para ver que vórtices estan juntos pone cada columna al lado de la
%otra y luego se carga los pares repetidos (un dibujito os ayudará hacedme caso)

pares = [trian(:,1) trian(:,2); trian(:,2) trian(:,3); trian(:,1) trian(:,3)];
pares = unique(pares, 'rows');

%Una vez tenemos los pares podemos hacer + cosas
distances = 0;
j = 0;
for i=1:length(pares)
 
    %Este if solo deja pasar las parejas que tengan, como minimo, un
    %vórtice en allowed
        if sum(pares(i,1) == allow) && sum(pares(i,2) == allow)
            j = j+1;
            
            %Si la pareja entra calcula la distancia entre los dos y
            %redefine el vector de parejas como las parejas que pasan el if
            distances(j)     = pdist([centrosc(pares(i,1),:); centrosc(pares(i,2),:)]);
            realPairs(j,1:2) = pares(i,:);
%             if distances(j) >15
%                 pares(i,:)
%                 
%                 [centrosc(pares(i,1),:); centrosc(pares(i,2),:)]
%                 pause
%             end
        end
end
 