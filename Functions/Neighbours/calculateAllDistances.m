function distance = calculateAllDistances(centros)

distance=zeros(sum(1:length(centros)-1),1);
m= 0;
for i = 1:length(centros)
    
    for j = i+1:length(centros)
        m=m+1;
       distance(m) = pdist([centros(i,:); centros(j,:)]);
       
    end
    
end
figure(34)
histogram(distance)
figure(23)