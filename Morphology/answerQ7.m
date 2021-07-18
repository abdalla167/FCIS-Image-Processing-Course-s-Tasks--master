function noCircleWithNoHole = answerQ7( img )
%answerQ7 This function calculate number of circle object with no holes in image

i = rgb2gray(img);
BI = im2bw(i);%convert img to binary

%object  that has hole
n=bwconncomp(BI);%return struct with connected components in binary image
s=regionprops(n,'Eulernumber');%returns a scalar that specifies the number 
%of objects in the region minus the number of holes in those objects 
arr2 = struct2array(s);

%square
BITest = imfill(BI,'holes');
n=bwconncomp(BITest);%return struct with connected components in binary image
s=regionprops(n,'Extent');%divide area of object overarea of bounding box so if object is square then it's 1
arr1 = struct2array(s);
[rows,si] = size(arr1);%rows always 1
noCircleWithNoHole=0;
for i=1:si
    if arr1(i)~=1 && arr2(i)==1
        noCircleWithNoHole = noCircleWithNoHole + 1;
    end
end

end