function FilterOutput = createFilter( matrix )
%createFilter this function creates Filter
matrix=fftshift(fft2(matrix));
[wR,hR]=size(matrix);
matrixCenterR=matrix( ceil(wR/2)-1:ceil(wR/2)+1 , ceil(hR/2)-1:ceil(hR/2)+1 );
matrixCenterR = matrix(wR/2,hR/2) ./ matrixCenterR;
D0R=median(abs(reshape(matrixCenterR,1,[]))) * 3;
DC=hR/2+1;
for i = 2:wR-1
    for j = 2:DC
        matrixCenterP=matrix( i-1:i+1 , j-1:j+1 );
        matrixCenterP = (matrix(i,j)) ./ matrixCenterP;
        DPixel=median(abs(reshape(matrixCenterP,1,[])));
        if DPixel > D0R
            matrix(i-1:i+1 , j-1:j+1)=0;
            matrix(wR-i-1 : wR-i+1 ,hR-j-1 : hR-j+1)=0;
        end
    end
end
%imshow(log(1+matrix),[]);
FilterOutput=ifft2(ifftshift(matrix));
%imshow(FilterOutput,[]);
end