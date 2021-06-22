%It calculates the number of neighbour with the allow list.

function neighbours = numberOfNeighbours(allow, triangulation)

for i =1:length(allow)
    neighbours(i) = length(find(triangulation == allow(i)));
end