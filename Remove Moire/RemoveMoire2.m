function RestoredImage = RemoveMoire2( img )
%RemoveMoire removing the noise
%   RestoredImage restored image after removing the noise.

img = rgb2gray(img);
co = fft2(img);
co = fftshift(co);
re = real(co);
im = imag(co);
mag = ((re.^2)+(im.^2)).^0.5;
logmag = log(mag);
co(157:171 , 118: 137)=0;
co(165:178 , 46:67)=0;

co = ifftshift(co);
co=ifft2(co);
co=uint8(co);
imshow(co,[]);
RestoredImage=co;


end

