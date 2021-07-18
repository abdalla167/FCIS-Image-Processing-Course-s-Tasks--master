function meanFilterMatrix = meanFilter( rows,columns )
%meanFilter  return matrix with men mask values
%   rows: Number of rows 
%   columns: Number of columns
meanFilterMatrix = ones(rows,columns);
pixelValue = 1 / (rows * columns);
meanFilterMatrix = pixelValue * meanFilterMatrix;
end