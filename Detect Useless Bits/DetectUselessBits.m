
%DetectUselessBits this function return an array with all useless bits indices
%   Img: input image ,Per: percent for the bit to be useless
Img=imread('BS2.png');  

[rows, columns, ~] = size(Img);

    I = rgb2gray(Img);
    expectedArray=[];
zeroFirst=0;zeroSecond=0;zeroThird=0;zeroFourth=0;zeroFifth=0;zeroSixth=0;zeroSeventh=0;zeroEighth=0;

for i=1:rows
    for j=1:columns
        firstBit=0;secondBit=0;thirdBit=0;fourthBit=0;fifthBit=0;sixthBit=0;seventhBit=0;eighthBit=0;
        eighthBit=bitand(I(i,j),bin2dec('10000000'));
        if eighthBit==0
            zeroEighth = zeroEighth + 1;
        end
        seventhBit=bitand(I(i,j),bin2dec('01000000'));
        if seventhBit==0
            zeroSeventh = zeroSeventh + 1;
        end
        sixthBit=bitand(I(i,j),bin2dec('00100000'));
        if sixthBit==0
            zeroSixth = zeroSixth + 1;
        end
        fifthBit=bitand(I(i,j),bin2dec('00010000'));
        if fifthBit==0
            zeroFifth = zeroFifth + 1;
        end
        fourthBit=bitand(I(i,j),bin2dec('00001000'));
        if fourthBit==0
            zeroFourth = zeroFourth + 1;
        end
        thirdBit=bitand(I(i,j),bin2dec('00000100'));
        if thirdBit==0
            zeroThird = zeroThird + 1;
        end
        secondBit=bitand(I(i,j),bin2dec('00000010'));
        if secondBit==0
            zeroSecond = zeroSecond + 1;
        end
        firstBit=bitand(I(i,j),bin2dec('00000001'));
        if firstBit==0
            zeroFirst = zeroFirst + 1;
        end
    end
end
totalPixelNo = rows * columns ;
expectedArray = [];
zeroFirst=totalPixelNo-zeroFirst; zeroSecond=totalPixelNo-zeroSecond; zeroThird=totalPixelNo-zeroThird; zeroFourth=totalPixelNo-zeroFourth; zeroFifth=totalPixelNo-zeroFifth; zeroSixth=totalPixelNo-zeroSixth; zeroSeventh=totalPixelNo-zeroSeventh; zeroEighth=totalPixelNo-zeroEighth;

if zeroFirst < (0.10 * totalPixelNo)
    expectedArray = [expectedArray 1];
end
if zeroSecond < (0.10 * totalPixelNo)
    expectedArray = [expectedArray 2];
end
if zeroThird < (0.10 * totalPixelNo)
    expectedArray = [expectedArray 3];
end
if zeroFourth < (0.10 * totalPixelNo)
    expectedArray = [expectedArray 4];
end
if zeroFifth < (0.10 * totalPixelNo)
    expectedArray = [expectedArray 5];
end
if zeroSixth < (0.10 * totalPixelNo)
    expectedArray = [expectedArray 6];
end
if zeroSeventh < (0.10 * totalPixelNo)
    expectedArray = [expectedArray 7];
end
if zeroEighth < (0.10 * totalPixelNo)
    expectedArray = [expectedArray 8];
end

