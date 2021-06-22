
function [averXY] = reducedNoise(nPoints, X, Y)

j =0;
if rem(nPoints,2)
    nPoints=nPoints+1;
end

for i = (nPoints/2)+1:nPoints:length(Y) -nPoints/2
    j = j+1;
   
    averY(j) = mean(Y(i-nPoints/2:i+nPoints/2));
    averX(j) = X(i);
end
averXY = [averX', averY'];