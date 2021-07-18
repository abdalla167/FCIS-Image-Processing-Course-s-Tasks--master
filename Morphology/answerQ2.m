function nObject = answerQ2( img )
%answerQ2 This function calculate number of object in image

i = rgb2gray(img);
BI = im2bw(i);%convert img to binary
[L, nObject] = bwlabel(BI);
end