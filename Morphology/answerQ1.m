function ratioO = answerQ1( img )
%answerQ1 This function calculate fraction of the image pixels is white

i = rgb2gray(img);
[width,height]=size(i);
BI = im2bw(i);%convert img to binary
nWhite = sum(BI(:));
ratioO = nWhite/(width * height);
end