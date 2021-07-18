function [man] = ExtractMan(Image1)
%ExtractMan this function extract man frm rgb image
%   Image1 image i want to exract man from
test=GetImageReady(Image1);
I=Image1;
[rows, columns]=size(test);
for i=1:rows
    for j=1:columns
        if test(i,j)~=1
            I(i,j,1)=0;
            I(i,j,2)=0;
            I(i,j,3)=0;
        end
    end
end
man = I;
imshow(man);
end