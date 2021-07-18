function maskSize = sizeOfGaussian( segma )
%sizeOfGaussian returns size of Gaussian matrix
%   segma segma of matrix
n = floor(3.7*segma-0.5);
maskSize=2*n+1;
end