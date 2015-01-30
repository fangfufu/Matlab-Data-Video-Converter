function [outArray, dataLength] = DataFramer(inArray)
%DATAFRAMER Convert data into appropriate video frame
%   Detailed explanation goes here

load('settings.mat');

BlockEndI = FrameWidth/BlockSizeI;
BlockEndJ = FrameHeight/BlockSizeJ;
if (floor(BlockEndI) ~= ceil(BlockEndI)) || ...
        (floor(BlockEndJ) ~= ceil(BlockEndJ))
    error('The specified block sizes are invalid');
end
% outArray = uint8(zeros([FrameHeight FrameWidth 3 ceil(numel(inArray)/(BlockEndI*BlockEndJ*3))]));
outArray = uint8(zeros([FrameHeight FrameWidth 3 ceil(numel(inArray)/(BlockEndI*BlockEndJ))]));
inArraySize = numel(inArray);
disp('inArrayElementCount:');
disp(inArraySize);
disp('outArraySize:');
disp(size(outArray));
disp('outArrayElementCount:');
disp(numel(outArray)/(BlockSizeI*BlockSizeJ));

dataLength = inArraySize;

%element number
m = 1;
disp('Processing frames');
disp('     ');
k = 1:3;
for l = 1:size(outArray, 4)
    %vertical
    for j = 1:BlockEndJ
        %horizontal
        for i = 1:BlockEndI
            %colour channel
%             for k = 1:size(outArray, 3)
                outArray(((j-1)*BlockSizeJ+1):(j*BlockSizeJ), ...
                    ((i-1)*BlockSizeI+1):(i*BlockSizeI), ...
                    k, l) = inArray(m);
                m = m + 1;
                fprintf('\b\b\b\b\b\b%05.2f%%', m/inArraySize*100);
                if m > inArraySize
                    disp(' ');
                    disp('Terminated at:');
                    disp(m - 1);
                    return;
                end
%             end
        end
    end
end
disp(' ');
end
