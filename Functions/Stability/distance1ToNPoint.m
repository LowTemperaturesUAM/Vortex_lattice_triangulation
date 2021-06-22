function distan = distance1ToNPoint(a,b)

dimensions = length(a);
[m,h]     = size(b);

eje = zeros(dimensions,1);


if m==dimensions
    
    number = h;
    distan = zeros(number, 1);
for i=1:number
    for j =1:dimensions
        eje(j) = (b(j,i)-a(j))^2;
    end
    distan(i) = sqrt(sum(eje));
end
  
else
 
    number = m;
    distan = zeros(number, 1);
for i=1:number
    for j =1:dimensions
        eje(j) = (b(i,j)-a(j))^2;
    end
    distan(i) = sqrt(sum(eje));
end

end
