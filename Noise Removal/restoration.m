clc; close all;clear all;
f = im2double(rgb2gray(imread('A.bmp')));
imshow(f), title('Original Image'); 

F = fft2(f);

%get power spectrum to see the noise

Mag = abs(F).^2; 
Mag  = mat2gray(log(Mag + 1)); 
Mag = fftshift(Mag);
figure, imshow(Mag), title('Power Spectrum'); 

%create filter notch filter 
%for remove vertical noise
  H = ones(size(f));
  x = 2;
  H(255-x:259+x, 190-x:194+x) = 0;
  H(255-x:259+x, 320-x:324+x) = 0;
  H = ifftshift(H);
  
  filtered = F .* H;

  %for remove Horizontal noise
  
  V = ones(size(f));
  y = 2;
  V(250-y:252+y, 255-y:257+y) = 0;
  V(270-y:272+y, 255-y:257+y) = 0;
  V = ifftshift(V);
  
  filtered = filtered .* V;

  V1 = ones(size(f));
  y1 = 2;
  V1(22-y1:229+y1, 255-y1:259+y1) = 0;
  V1(280-y1:284+y1, 255-y1:259+y1) = 0;
  V1 = ifftshift(V1);
  
  filtered = filtered .* V1;

  
  
  V2 = ones(size(f));
  y2 = 2;
  V2(215-y2:219+y2, 255-y2:259+y2) = 0;
  V2(290-y2:294+y2, 255-y2:259+y2) = 0;
  V2 = ifftshift(V2);

  filtered = filtered .* V2;
  
  

%Power Spectrum of filtered
Mag2 = abs(filtered).^2; 
Mag2  = mat2gray(log(Mag2 + 1)); 
Mag2 = fftshift(Mag2);
figure, imshow(Mag2), title('Power Spectrum'); 


f1 = ifft2(filtered);
figure, imshow(f1), title('Restored'); 
