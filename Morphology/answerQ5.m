function sObject = answerQ5( img )
%answerQ5 This function calculate number of square object in image

i = rgb2gray(img);
BI = im2bw(i);%convert img to binary
BI = imfill(BI,'holes');
n=bwconncomp(BI);%return struct with connected components in binary image
s=regionprops(n,'Extent');%divide area of object overarea of bounding box so if object is square then it's 1
arr = struct2array(s);
[rows,si] = size(arr);%rows always 1
sObject=0;
for i=1:si
    if arr(i)==1
        sObject=sObject+1;
    end
end
end