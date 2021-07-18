function MatrixofGauss = Gauss1(Size,Sig)
%Gauss1 create Gaussian Filter 
%   Size MaskSize
%   Sig  Sigma

    MatrixofGauss=zeros(Size,Size);
    start = -Size/2;
    endL = Size/2-1;%(-1)due to 0
    iMat=0;
    sum=0;
    jMat=0;
    for i= start: endL
        iMat = iMat+1;
       for j=start: endL
           jMat = jMat+1;
           fis=2*(22/7)*(Sig.^2);
           sec=((i.^2)+(j.^2))/(2* Sig.^2);       
           MatrixofGauss(iMat,jMat)= (1/fis) * exp(-sec);
           sum = sum + ((1/fis) * exp(-sec));
       end
       jMat=0;
    end
    MatrixofGauss = MatrixofGauss * (1/sum);
end