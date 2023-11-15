function openFrame(forward)
fig = findobj('Name', 'Image');


NFrames = fig.UserData.NumberOfImages;

        Frame = fig.UserData.Frame ;
        Name = ['Struct', num2str(Frame)];
    
        if isfield(fig.UserData,'Frames')
            234
        fig.UserData.Frames.(Name) = rmfield(fig.UserData,'Frames');
        else
            123
            fig.UserData.Frames.(Name) = fig.UserData;

        end
if forward 
   
    if fig.UserData.Frame<NFrames

        fig.UserData.Frame = fig.UserData.Frame +1;
        Frame = fig.UserData.Frame ;
    
        
    end    
else
    if fig.UserData.Frame>1
        fig.UserData.Frame = fig.UserData.Frame -1;
        Frame = fig.UserData.Frame ;

    end
end
   path = fig.UserData.Path ;
    name = fig.UserData.Name ;
    ext = fig.UserData.ext ;
Map = imread([path name{Frame} ext{Frame}]);

Name = ['Struct', num2str(Frame)];
imshow(Map);
fig.Children.Title.String = ['Follow Mode: ', num2str(Frame), ...
                   '/', num2str(NFrames) ];
fig.UserData.Map =  Map;
for i=1:Frame-1
 fig.UserData.Frames.(Name).centrosc
    Name1 = ['Struct', num2str(i)];
%     check(i) = sum(sum(~(fig.UserData.Frames.(Name).centrosc ==... 
%                 fig.UserData.Frames.(Name1).centrosc )));
            
      match = ismember(fig.UserData.centrosc(:,1),...
                          fig.UserData.Frames.(Name1).centrosc(:,1) ) ;
                      
    if sum(match) == length(fig.UserData.Frames.(Name).centrosc(:,1)) || ...
       sum(match) == length(fig.UserData.Frames.(Name1).centrosc(:,1) )
    'ihiañ'
        check(i) = 0;
    else
        check(i) = 1;
        'Disinto'
    end
        
end
if ~exist('check')
    check(1) = 1;
end
    if sum(check) == 0 || Frame > 1
         Name1 = ['Struct', num2str(Frame-1)];
        %fig.UserData.Frames.(Name1).centrosc =  fig.UserData.centrosc ;
        fig.UserData.centrosc = fig.UserData.Frames.(Name1).centrosc;
        'Igual'
    else
        fig.UserData.centrosc =  fig.UserData.Frames.(Name).centrosc ;
        'Distinto'
        
    end
        
    




paint(Map, fig.UserData.centrosc, fig.UserData.trian)
 Frames = fig.UserData.Frames;
 fig.UserData = fig.UserData.Frames.(Name);
 fig.UserData.Frames = Frames;
%fig.UserData