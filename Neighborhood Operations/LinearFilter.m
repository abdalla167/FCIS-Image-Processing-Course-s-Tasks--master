function Out = LinearFilter(I, Filter, Postproc)
%LinearFilter   performs the convolution process using a given linear filter
%   I: 2D buffer of the input image
%   Out: 2D buffer of the resulting image
%   Filter: 2D buffer that contains the values of the mask to be convolved
%   Postprocess: enumeration that specifies the required postprocessing
%                method to be string containts ‘none’, ‘cutoff’, ‘absolute’
%                , 'cutoff , absolute'
[row,column,numOfColor]=size(I);
[FRow,FColumn,FNumOfColor]=size(Filter);
paddedWidthVal=(FColumn-1)/2;
paddedHightVal=(FRow-1)/2;
if numOfColor == 1
    newImage=padarray(I,[paddedHightVal,paddedWidthVal]);
    temp=getImage(paddedWidthVal,paddedHightVal,row,column,newImage,FRow,FColumn,Filter);
elseif numOfColor == 3
    r=I(:,:,1);
    g=I(:,:,2);
    b=I(:,:,3);
    red=padarray(r,[paddedHightVal,paddedWidthVal]);
    green=padarray(g,[paddedHightVal,paddedWidthVal]);
    blue=padarray(b,[paddedHightVal,paddedWidthVal]);
    out1=getImage(paddedWidthVal,paddedHightVal,row,column,red,FRow,FColumn,Filter);
    out2=getImage(paddedWidthVal,paddedHightVal,row,column,green,FRow,FColumn,Filter);
    out3=getImage(paddedWidthVal,paddedHightVal,row,column,blue,FRow,FColumn,Filter);
    temp(:,:,1)=out1;
    temp(:,:,2)=out2;
    temp(:,:,3)=out3;
end
temp=uint8(temp);
if strcmp(Postproc,'none')==1
	Out=temp;
elseif strcmp(Postproc,'cutoff')==1
    Out=uint8(temp);
elseif strcmp(Postproc,''cutoff , absolute'')==1
	Out=abs(temp);
    Out=uint8(temp);
elseif strcmp(Postproc,'absolute')==1
	Out=abs(temp);
end
end