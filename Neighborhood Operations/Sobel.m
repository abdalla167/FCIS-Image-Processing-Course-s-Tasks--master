function sobelFilterMatrix = Sobel(Mask)
%Sobel It generates 3x3 constant sobel masks 
%   Mask Vertical OR Horizontal mask
if Mask =='H'
    sobelFilterMatrix = [-1,-2,-1;0,0,0;1,2,1];
elseif Mask =='V'
    sobelFilterMatrix = [-1,0,1;-2,0,2;-1,0,1];
end