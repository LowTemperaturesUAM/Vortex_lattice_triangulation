function hard = hardSphereSquare(nPuntos,max,min, Radio)
if length(min:2*Radio:max) < 1000
    disp('Bueno')
    a = min:2*Radio:max;
    b = min:2*Radio:max;
    hard = [reshape(meshgrid(a), length(a)*length(a), 1)   ...
        reshape(meshgrid(b)', length(a)*length(a), 1)];
else
    disp('Mal')
    a = linspace(min, max, nPuntos);
    b = a;
    hard = [reshape(meshgrid(a), length(a)*length(a), 1)   ...
          reshape(meshgrid(b)', length(a)*length(a), 1)];
end
