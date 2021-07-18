function noSquareWithHole = answerQ6( img)
%answerQ6 This function calculate number of square object with holes in image

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
stat = regionprops(BITest,'boundingbox');%Returns the smallest rectangle containing the region, specified as a 1-by-Q*2 vector, where Q is the number of image dimensions
arr1 = struct2array(s);
noSquareWithHole = 0;
imshow(img); hold on;
for i=1:numel(stat)
    if arr1(i)==1 && arr2(i)~=1
        noSquareWithHole = noSquareWithHole + 1;
        bb = stat(i).BoundingBox;
        rectangle('position',bb,'edgecolor','r','linewidth',2);
    end
end

end