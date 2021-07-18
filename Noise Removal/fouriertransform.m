f = im2double(rgb2gray(imread('A.bmp')));
imshow(f), title('Original Image'); 
[w,h]= size(f);

F = fft2(f);

%get power spectrum to see the noise
%I didn't see any noise actually :D
Mag = abs(F).^2; 
Mag  = mat2gray(log(Mag + 1)); 
Mag = fftshift(Mag);
figure, imshow(Mag), title('Power Spectrum'); 
[m,n]= size(Mag);
%create filter ILP like
H = ones(size(f));
x = 20;   y = 20;
d1x = (w/2)+x ;   d1y =(h/2)+y;
d2x = (w/2)-x ;   d2y =(h/2)-y;
 for i=1:m
     for j=1:n
         if (d1x && d2x > x)&&(d1y && d2y > y)
             H(i,j) = 1;
         elseif(d1x && d2x < x)&&(d1y && d2y < y)
             H(i,j)=0;
         end 
     end 
 end

%H(165-x:169+x, 127-x:131+x) = 0;
%H(170-x:174+x, 61-x:65+x) = 0;

H = ifftshift(H);

figure, imshow(H);

filtered = F .* H;


%Power Spectrum of filtered
Mag2 = abs(filtered).^2; 
Mag2  = mat2gray(log(Mag2 + 1)); 
Mag2 = fftshift(Mag2);
figure, imshow(Mag2), title('Power Spectrum'); 


f1 = ifft2(filtered);
figure, imshow(f1), title('Restored'); 
