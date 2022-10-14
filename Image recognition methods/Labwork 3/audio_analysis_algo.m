% Audio file directory
FileName1='/home/logan/github/Y3S1/Image recognition methods/Labwork 3/StarWars.wav';
% Introduction of audio signal
[yS1,fS1] = audioread(FileName1);
% Determination of the number of samples in the signal
nS1=length(yS1); % signal length
% Determination of the signal duration (с)
DurationS1=nS1/fS1; % c
% sliding window size
nW1=128;
% pause detection threshold
hP1=0.2;
% maximum detection error (frequency difference during detection)
errorFr=10; % Hz
% frequency of notes in octaves (supplemented with zeros up to 10):
OctavaFr=[
    16.352 18.354 20.602 21.827 24.500 27.500 30.368 0 0 0 ...
    32.703 36.708 41.203 43.654 48.999 55.000 61.735 0 0 0 ...
    65.406 73.416 82.407 87.307 97.999 110.0 123.47 0 0 0 ...
    130.81 146.83 164.81 174.61 196.00 220.00 246.94 0 0 0 ...
    261.63 293.66 329.63 349.23 392.00 440.00 493.88 0 0 0 ...
    523.25 587.33 659.26 698.46 783.99 880.00 987.77 0 0 0 ...
    1046.3 1174.7 1318.5 1396.9 1568.0 1760.0 1975.5 0 0 0 ...
    2093.0 2349.3 2637.0 2793.8 3136.0 3520.0 3951.1 0 0 0 ...
    4186.0 4698.6 5274.0 5587.7 6271.9 7040.0 7902.1 0 0 0]';

% Octave names
Octavas(1).Name='Субконтроктава';
Octavas(2).Name='Контроктава';
Octavas(3).Name='Большая октава';
Octavas(4).Name='Малая октава';
Octavas(5).Name='Первая октава';
Octavas(6).Name='Вторая октава';
Octavas(7).Name='Третья октава';
Octavas(8).Name='Четвертая октава';
Octavas(9).Name='Пятая октава';

% названия нот
Notes(1).Name='До';
Notes(2).Name='Ре';
Notes(3).Name='Ми';
Notes(4).Name='Фа';
Notes(5).Name='Соль';
Notes(6).Name='Ля';
Notes(7).Name='Си';
Notes(8).Name='До';

% Построение графика значений амплитуды сигнала в зависимости от номеров отсчетов:
figure('Name','Сигнал (отсчеты)')
plot(yS1)
xlabel('Отсчеты')
ylabel('Амплитуда')
title('Сигнал ')

% Построение графика значений амплитуды сигнала в зависимости от времени
xTime1=linspace(0,DurationS1,nS1)';
figure('Name','Сигнал (с)')
plot(xTime1,yS1)
xlabel('Время, с')
ylabel('Амплитуда')
title('Сигнал (с)')

% Построение графика спектр сигнала yS1
nFFT1=length(yS1);
F1=fft(yS1,nFFT1);
F2=abs(F1).^2;
nFFT2=floor(nFFT1/2);
frSpectr=linspace(0,fS1/2,nFFT2)';

% Построение графика энергетического спектра сигнала
figure('Name','Энергетический спектр исходного сигнала' )
hold on
plot(frSpectr,F2(1:nFFT2))
xlabel('Частота')
ylabel('Квадрат коэффициентов ДПФ')
title('Энергетический спектр исходного сигнала')
hold off

% Построение графика абсолютного значения амплитуд и порогового значения
figure('Name','Модуль сигнала (порог пауз)')
hold on
plot(abs(yS1))
plot([1,nS1],[hP1 hP1])
xlabel('Отсчеты')
ylabel('Модуль амплитуды')
title('Модуль сигнала (порог пауз)')
hold off

for k1=1:nSound1
    disp(" ")
    disp(['=== Fragment k1=' int2str(k1)])
    % создать вектор фрагмента
    Frame1=yS1(FrameSamples(k1,1):FrameSamples(k1,2));
    nFFT1=length(Frame1);
    disp(['    Sound duration (counts):' int2str(nFFT1)])
    % вычислить коэффициенты БПФ
    F1=fft(Frame1,nFFT1);
    % вычислить квадраты коэффициентов БПФ
    F2=abs(F1).^2;
    nFFT2=floor(nFFT1/2); % половина точек ДПФ
    % вычислить частоты, соответствующие коэффициентам ДПФ
    % fS1/2 - половина частоты дискретизации
    frSpectr=linspace(0,fS1/2,nFFT2);
    % построить график энергетического спектра сигнала для визуального решения
    % построить ограниченное количество графиков спектра
    if k1<=10
        figure('Name',['Энергетический спектр фрагмента сигнала k1=',int2str(k1)])
        hold on
        plot(frSpectr,F2(1:nFFT2))
        xlabel('Частота')
        ylabel('Квадрат коэффициентов ДПФ')
        title(['Энергетический спектр фрагмента сигнала k1=',int2str(k1)])
        hold off
    end % if k1<=10
    % определить частоту, соответствующую макс значению спектра
    [MaxF,iMaxF]=max(F2(1:nFFT2));
    frMaxF=frSpectr(iMaxF);
    disp(['    Sound frequency frMaxF=' num2str(frMaxF)])
    % классифицировать звук по значению его частоты
    % определить ближайшую частоту в октавах
    [MinfrOct,iMinfrOct]=min(abs(OctavaFr-frMaxF));
    % вывести информацию о ноте
    if MinfrOct > errorFr
        % большая погрешность классификации
        disp('Detected sound is not classified')
    else
        disp(['    Note number in the list of all octaves iMinfrOct=' ...
            int2str(iMinfrOct)])
        % номер октавы
        nOct=floor(iMinfrOct/10)+1;
        % номер ноты в октаве
        nNote=mod(iMinfrOct,10);
        disp(['    ' Octavas(nOct).Name ,', нота ' Notes(nNote).Name])
    end % if MinfrOct > errorFr

    % ==============================================
    % === Отобразить области пауз
    % ==============================================
    % построить график сигнала с выделенными паузами
    figure('Name','Сигнал (паузы)')
    hold on
    plot(yS1)
    xlabel('Отсчеты')
    ylabel('Амплитуда')
    title('Сигнал (паузы)')
    % выделить паузs
    nEnd1=FrameSamples(1,1)-1;
    plot([1,nEnd1],[0 0],'r','LineWidth',5)
    for k1=1:nSound1-1
        nBeg1=FrameSamples(k1,2)+1;
        nEnd1=FrameSamples(k1+1,1)-1;
        % выделить паузу
        plot([nBeg1,nEnd1],[0 0],'r','LineWidth',5)
    end % for k1=1:nSound1-1
    nBeg1=FrameSamples(nSound1,2)+1;
    plot([nBeg1,nS1],[0 0],'r','LineWidth',5)
    hold off
end % for k1=1:nSound1

























