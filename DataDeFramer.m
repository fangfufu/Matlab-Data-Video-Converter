function [ outArray ] = DataDeFramer( inArray, dataLength )
%DATADEFRAMER Convert video frame into the original data
%   Detailed explanation goes here

load('settings.mat');

BlockEndI = FrameWidth/BlockSizeI;
BlockEndJ = FrameHeight/BlockSizeJ;
if (floor(BlockEndI) ~= ceil(BlockEndI)) || ...
        (floor(BlockEndJ) ~= ceil(BlockEndJ))
    error('The specified block sizes cannot be fit into 1080p video');
end
outArray = uint8(zeros([dataLength, 1]));
disp('inArraySize:');
disp(size(inArray));
disp('inArrayElementCount:');
disp(numel(inArray)/(BlockSizeI*BlockSizeJ));
%element number
m = 1;
disp('Processing frames');
disp('     ');
%frames
for l = 1:size(inArray, 4)
    %vertical
    for j = 1:BlockEndJ
        %horizontal
        for i = 1:BlockEndI
            %colour channel
            for k = 1:size(inArray, 3)
                tmp = squeeze(inArray(((j-1)*BlockSizeJ+1):(j*BlockSizeJ), ...
                    ((i-1)*BlockSizeI+1):(i*BlockSizeI), ...
                    k, l));
                outArray(m) = round(mean(tmp(:)));
                m = m + 1;
                fprintf('\b\b\b\b\b\b%05.2f%%', m/dataLength*100);
                if m > dataLength
                    disp(' ');
                    disp('Terminated at:');
                    disp(m - 1);
                    return; 
                end
            end
        end
    end
end
disp(' ');
end
