function RestoredImage = RemoveMoire( img )
%RemoveMoire removing the noise
%   RestoredImage restored image after removing the noise.

img = rgb2gray(img);
co = fft2(img);
co = fftshift(co);
re = real(co);
im = imag(co);
mag = ((re.^2)+(im.^2)).^0.5;
logmag = log(mag);
co(70:92 ,256:278)=0;
co(111:134 , 254:270)=0;
co(204:224 , 234: 252)=0;
co(245:271 , 223:251)=0;
co = ifftshift(co);
co=ifft2(co);
co=uint8(co);
imshow(co,[]);
RestoredImage=co;

end

