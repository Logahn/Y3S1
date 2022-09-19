function sample_gui2

% SIMPLE_GUI2 Select diagram file with the "Open" button
% Create a greyscale image with the 'Transform' button

f = figure('Visible','on','Position', [360,500,650,285]);

hopen = uicontrol('Style', 'pushbutton',...
    'String','Open', 'Position',[315,220,70,25],...
    'Callback', @openbutton_Callback);

hconvert = uicontrol('Style','pushbutton',...
    'String','Transform','Position',[315,180,70,25],...
    'Callback',@pushbutton2_Callback);

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

f.Name = 'Simple GUI2';

movegui(f,'center')

f.Visible = 'on';

    function openbutton_Callback(hObject,eventdata,handles)
        [fname,pname] = uigetfile('*.*','Enter data file'); % выбор изображения
        global A; % создание глобальной переменной А
        A=imread(fullfile(pname, fname)); % считывание выбранного изображения
        axes(ha1); % Position of displayed image
        set(ha1);
        imshow(A,[]);title('Source Image'); % вывод выбранного изображения на форму
    end


% Function for creation of greyscale image
    function pushbutton2_Callback(hObject, eventdata, handles)
        global A; % создание глобальной переменной А
        global B; % создание глобальной переменной B
        B=A(:,:,1); % выбрать первую цветовую компоненту изображения в формате RGB
        % Определить размеры изображения
        [N1,N2]=size(B);
        % Вывод исходного изображения на экран
        axes(ha2); 
        set(ha2);
        imshow(B, []);title('Greyscale Image');
    end
end