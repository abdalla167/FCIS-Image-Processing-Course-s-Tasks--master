function [out] = AddMan(Image2,  man)
%AddMan add man to another image
[rows, columns]=size(man);
for i=1:rows
    for j=1:columns
        if man(i,j)>0
            Image2(i,j)=man(i,j);
        end
    end
end
out = Image2;
imshow(out);
end

