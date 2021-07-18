function imageMat = getImage( paddedWidthI,paddedHightI,rowI,columnI,newImage,rowF,columnF,Filter )
%getImage this function returns an image after applying required filter
%   paddedWidthI,paddedHightI number of rows and coulmns added for image
%   rowI,columnI number of rows and columns for original image
%   newImage original image
%   rowF,columnF number of rows and columns of filter
%   Filter filter that should be performed for image
    startH=1+(paddedHightI);
    endH=rowI+(paddedHightI);
    startW=1+(paddedWidthI);
    endW=columnI+(paddedWidthI);
    imageMat=zeros(rowI,columnI);
    imageMat=double(imageMat);
    newImage=double(newImage);
    for i=startH:endH
        for j=startW:endW
            counter=0;
            MStartH=i-((rowF-1)/2)-1;
            MstartW=j-((columnF-1)/2)-1;
            for xF=1:rowF
                for yF=1:columnF
                    fVal=Filter(xF,yF);
                    iVal=newImage(MStartH+xF,MstartW+yF);
                    counter = counter + (fVal*iVal);
                end
            end
            imageMat(i-paddedHightI,j-paddedWidthI)=uint8(counter);        
        end
    end
end