function matrixOfGauss = Gauss2( Sig )
%Gauss2 create Gaussian Filter
%   sig Sigma
size = SizeOfgaussian(Sig);
matrixOfGauss = Gauss1(size,Sig);
end