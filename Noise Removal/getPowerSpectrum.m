function out = getPowerSpectrum( F )
%UNTITLED This function gets power spectrum to see the noise


out = abs(F).^2; 
out = log(out+1);
out = fftshift(out);

end