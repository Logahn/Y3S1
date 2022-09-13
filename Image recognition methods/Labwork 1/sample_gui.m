function sample_gui

% SIMPLE_GUI Select diagram file with the "Open" button
% Create the histogram of image brightness with the "Histogram" button

f = figure('Visible','on','Position', [360,500,650,285]);

hopen = uicontrol('Style', 'pushbutton',...
    'String','Open', 'Position',[315,220,70,25],...
    'Callback', @openbutton_Callback);

hconvert = uicontrol('Style','pushbutton',...
    'String','Histogram','Position',[315,180,70,25],...
    'Callback',@convertbutton_Callback);

% Adding of axes
ha1 = axes('Units','pixels','Position',[50,60,200,185]);
ha2 = axes('Units','pixels','Position',[435,60,200,185]);

% Setting the button in the center
align([hopen,hconvert],'Center','None');

f.Units = 'normalized';
ha1.Units = 'normalized';
ha2.Units = 'normalized';
hopen.Units = 'normalized';
hconvert.Units = 'normalized';

f.Name = 'Simple GUI';

movegui(f,'center')

f.Visible = 'on';

    function openbutton_Callback(source,eventdata)
        [fname,pname] = uigetfile('*.*','Enter data file'); %Image selection
        global A; % Creation of global variable ??
        A=imread(fullfile(pname, fname)); % Reading of selceted image
        axes(ha1); % Position of displayed image
        set(ha1);
        imshow(A,[]); % Output of selected image on the form
    end


% Function for creation of brightness histogram of image
    function convertbutton_Callback(source,eventdata)
        global A;
        I=rgb2gray(A); 
        axes(ha2); 
        set(ha2);
        imhist(I);
    end
end