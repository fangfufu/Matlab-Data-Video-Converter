function [dataArray, frameArray] = VideoDecode(videoName, fileName, dataLength )
%VIDEODECODE Decode a video into data
%   Detailed explanation goes here
frameArray = ArrayReader(videoName);
dataArray = BytePacker(DataDeFramer(frameArray, dataLength));
FileWriter(dataArray, fileName);
end

