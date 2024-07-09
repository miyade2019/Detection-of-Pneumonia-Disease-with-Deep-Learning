% Örnek olarak, bir PNG görüntüsünü yükleme
image = imread('h.jpg');
% Görüntüyü veri.mat olarak kaydetme
save('veri.mat', 'image');


%%
imds = imageDatastore('test/NORMAL', ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
save('welch.mat', 'imds');
%%
% Örnek olarak, veriyi yükleme
data = load('welch.mat');

%%
% Örnek veri oluşturma
%data = randn(1, 1000);  % 1000 elemanlı rastgele bir vektör

% Welch yöntemini kullanarak spektral analiz yapma
fs = 49; % örnekleme frekansı
window = 512; % pencere uzunluğu
overlap = 256; % örtüşme miktarı

[Pxx, F] = pwelch(data, window, overlap, [], fs);

% Sonuçları görselleştirme
figure;
semilogy(F, Pxx);
title('Welch Yöntemi ile Spektral Analiz');
xlabel('Frekans (Hz)');
ylabel('Güç Spektral Yoğunluğu');
grid on;
%%
% Örnek olarak, bir struct içindeki görüntü verilerini çıkarma ve birleştirme
img1 = imread('test\NORMAL\IM-0001-0001.jpeg');
img2 = imread('test\NORMAL\IM-0003-0001.jpeg');
img3 = imread('test\NORMAL\IM-0005-0001.jpeg');

% Struct oluşturma
%data_struct.data1 = double(rgb2gray(img1));
%data_struct.data2 = double(rgb2gray(img2));
%data_struct.data3 = double(rgb2gray(img3));

% Verileri birleştirme
data = [img1(:)' img2(:)' img3(:)'];

% Örnekleme frekansı
fs = 1000; % Örneklem frekansını uygun bir değere ayarlayın

% Pencere uzunluğu ve örtüşme miktarı
window = 512;
overlap = 256;

% Welch yöntemini kullanarak spektral analiz yapma
[Pxx, F] = pwelch(data, window, overlap, [], fs);

% Sonuçları görselleştirme
figure;
semilogy(F, Pxx);
title('Welch Yöntemi ile Spektral Analiz');
xlabel('Frekans (Hz)');
ylabel('Güç Spektral Yoğunluğu');
grid on;
%%
    


