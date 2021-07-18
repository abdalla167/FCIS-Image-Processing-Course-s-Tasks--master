function nHole = answerQ3( img )
%answerQ3 This function calculate number of holes in image
i = rgb2gray(img);
BI = im2bw(i);%convert img to binary
n=bwconncomp(BI);%return struct with connected components in binary image
s=regionprops(n,'Eulernumber');%returns a scalar that specifies the number 
%of objects in the region minus the number of holes in those objects 
nHole=0;
arr = struct2array(s);
[rows,si] = size(arr);%rows always 1
for i=1:si
    if isequal(arr(i),0) == 1
        nHole=nHole+1;
    elseif isequal(arr(i),-1) == 1
        nHole=nHole+2;
    end
end

end