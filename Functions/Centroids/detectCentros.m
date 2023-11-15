function centroids = detectCentros(Map, Area, threshold, Inverse)
fig = findobj('Name', 'Image');
cla(fig.Children);
MapO = Map;
Map= (Map(1:length(Map(:,1,1)),1:length(Map(1,:,1)),1));
h = fspecial('average',[5,5]);
Map=imfilter(Map,h);
BW = im2bw(Map, threshold);%Parametro de negro
if Inverse
    BW =~BW;
end
imageR=bwlabel(BW,8);
s = regionprops (imageR, 'Area');

idx = find([s.Area] > Area);
BW2 = ismember(imageR,idx);

imageR2=bwlabel(BW2,8);

s2 = regionprops (imageR2, 'Centroid');
centroids = cat(1, s2.Centroid);
imshow(MapO)
hold on
plot(centroids(:,1), centroids(:,2), 'wo');

end
