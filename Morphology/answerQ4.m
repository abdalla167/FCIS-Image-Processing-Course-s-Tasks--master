function nObject = answerQ4( img )
%answerQ4 This function calculate number of object that has holes in image
i = rgb2gray(img);
BI = im2bw(i);%convert img to binary
n=bwconncomp(BI);%return struct with connected components in binary image
s=regionprops(n,'Eulernumber');%returns a scalar that specifies the number 
%of objects in the region minus the number of holes in those objects 
nObject=0;
arr = struct2array(s);
[rows,si] = size(arr);%rows always 1
for i=1:si
    if arr(i)~=1
        nObject=nObject+1;
    end
end

end