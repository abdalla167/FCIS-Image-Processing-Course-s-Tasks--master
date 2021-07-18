function [ BWImage ] = GetImageReady( Image1 )
%GetImageReady Summary of this function goes here
%   Image1 image i want to use it
I=Image1;
red=I(:,:,1);
green=I(:,:,2);
blue=I(:,:,3);
[rows, columns]=size(red);
for i=1:rows
    for j=1:columns
        blue(i,j) = blue(i,j) - max( red(i,j), green(i,j) );
    end
end
red=medfilt2(double(red), [5,5]);
green=medfilt2(double(green), [5,5]);
blue=medfilt2(double(blue), [5,5]);
red = edge(red,'canny');
green = edge(green,'canny');
blue = edge(blue,'canny');
I=red+green+blue;
BWImage = I;
BWImage=imfill(BWImage,'holes');
BWImage=bwareafilt(logical(BWImage),1);
imshow(BWImage);

end