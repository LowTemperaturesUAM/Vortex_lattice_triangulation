function [path, name, ext] = openFollow()

 [file, path] = uigetfile('*.*','MultiSelect', 'on');
 
            for i=1:length(file)
            [~,name{i},ext{i}] = fileparts(file{i});
            end
            fig = findobj('Name', 'Image');
            fig.UserData.NumberOfImages = length(file) ;
            fig.UserData.Path = path;
            fig.UserData.Name = name;
            fig.UserData.ext = ext;
            fig.UserData.Frame = 1;
            fig.Visible = 'on';
            Map = imread([path name{1} ext{1}]);
            fig.UserData.Map = Map;
            imshow(Map);