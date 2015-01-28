function [ outArray ] = ArrayReader( inName )
%ARRAYREADER Convert a video file into the original array
%   Does not check if the file is valid
%   Detailed explanation goes here

load('settings.mat');

readerObj = VideoReader(inName);
if readerObj.Width ~= FrameWidth || readerObj.Height ~= FrameHeight
    error('Invalid input video dimension');
end

i = 0;

while hasFrame(readerObj)
    i = i + 1;
    tempFrame = double(zeros([FrameHeight FrameWidth 3]));
    for j = 1:Repeat
        tempFrame = tempFrame + double(readFrame(readerObj));
    end
    outArray(:,:,:,i) = uint8(round(tempFrame ./ Repeat)); %#ok<AGROW>
end

disp('outArray size:');
disp(size(outArray));

end

