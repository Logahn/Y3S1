function prog()
[image1,img1]=img_read1('к.png');
[image2,img2]=img_read1('и.png');
[image3,img3]=img_read1('ц.png');
[image4,img4]=img_read1('у.png');
[image5,img5]=img_read1('е.png');

figure
imshow(img1,[])
figure
plotchar(double(image1)); % символ к

figure
imshow(img2,[])
figure
plotchar(double(image2)); % символ и

figure
imshow(img3,[])
figure
plotchar(double(image3)); % символ ц

figure
imshow(img4,[])
figure
plotchar(double(image4)); % символ у

figure
imshow(img5,[])
figure
plotchar(double(image5)); % символ е

RA=[image1,image2,image3,image4,image5];


% %Создаем переменные для создания нейронной сети в NNtool
P0=double(RA);
[R0,Q0] = size(P0);
T0=eye(Q0);
[S2,Q0] = size(T0);

% Для обучения сети нам понадобятся данные с шумом. Создадим эти данные,введя следующий код в окно команд:
%Создаем переменные для обучения на зашумленных данных нейронной сети в
% nnstart
P1=P0;
T1=T0;
for i=1:100 % 100 можно увеличить количество образцов для обучения
P1=[P1,P0+rand(R0,Q0)*0.1,P0+rand(R0,Q0)*0.2];
T1=[T1,T0,T0];
end

noisy1=P0(:,1)+randn(35,1)*0.2;
figure
plotchar(noisy1); % Зашумленный первый символ
disp('Завершено формирование данных для создания и обучения сети')

end


function [y,img1] = img_read1(x)
%UNTITLED Summary of this function goes here
% Detailed explanation goes here
img=imread(x);
img1=img(:,:,1)';
img2=reshape(img1,[35, 1]);
img3=img2;
for i=1:35
    %if (img2(i,1)==0)
    if (img2(i,1) < 255)
        img3(i,1)=1;
    end
end
for i=1:35
    if (img2(i,1)==255)
        img3(i,1)=0;
    end
end
y=img3;
end



