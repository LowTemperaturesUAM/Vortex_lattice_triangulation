function [Area, threshold, Inverse] = menuDetectaCentros()

    btn = uicontrol('Style', 'pushbutton', 'String', 'Detect!',...
        'Position', [20 20 50 20]);
     threshold = uicontrol('Style', 'slider',...
        'Min',0,'Max',1,'Value',0.5,...
        'Position', [20 200 20 50]);
     Area = uicontrol('Style', 'slider',...
        'Min',1,'Max',100,'Value',50,...
        'Position', [20 150 20 50]);
    
     Inverse = uicontrol('Style', 'checkbox',...
        'Value',1,...
        'Position', [400 20 50 100  ]);
       % 'Callback', 'cla');     