function  RestoredImage = RemovePeriodicNoise( image )
close all;
warning off;
img = image;
%RemovePeriodicNoise This Remove Periodic Noise
red = image(:,:,1);
green = image(:,:,2);
blue = image(:,:,3);

%get power spectrum to see the noise

%create filters
redFilter=createFilter(red);
%HR = ifftshift(redFilter);
%I = find(redFilter==0);
%figure, imshow(H,[]);
%filteredR = FR .* HR;

greenFilter=createFilter(green);
%HG = ifftshift(greenFilter);
%I = find(redFilter==0);
%figure, imshow(H,[]);
%filteredG = FG .* HG;

blueFilter=createFilter(blue);
%HB = ifftshift(blueFilter);
%I = find(redFilter==0);
%figure, imshow(H,[]);
%filteredB = FB .* HB;

%Power Spectrum of filtered
  MagR2 = getPowerSpectrum(fft2(redFilter));
  imshow(MagR2);
%  MagG2 = getPowerSpectrum(greenFilter);
%  MagB2 = getPowerSpectrum(blueFilter);
%  figure, imshowpair(MagR,MagR2,'montage'), title('Red Power Spectrum');
%  figure, imshowpair(MagG,MagG2,'montage'), title('Green Power Spectrum');
%  figure, imshowpair(MagB,MagB2,'montage'), title('Blue Power Spectrum');
%  

%original Image


RestoredImage = image;
image(:,:,1) = redFilter;
image(:,:,2) = greenFilter;
image(:,:,3) = blueFilter;
figure,imshow(img), title('BEFORE');
figure,imshow(image), title('AFTER');

end