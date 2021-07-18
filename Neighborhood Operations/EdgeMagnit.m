function result = EdgeMagnit(I)
%EdgeMagnit shall do edge magnitude
%   I original image
sobelFH=Sobel('H');
sobelFV=Sobel('V');
X = LinearFilter(I,sobelFH,'none');
Y = LinearFilter(I,sobelFV,'none');
temp=abs(X+Y);
result=uint8(temp);
end