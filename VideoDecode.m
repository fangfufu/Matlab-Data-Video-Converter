function [dataArray] = VideoDecode(videoName, fileName, dataLength )
%VIDEODECODE Summary of this function goes here
%   Detailed explanation goes here

frames = ArrayReader(videoName);
dataArray = DataDeFramer(frames, dataLength);
FileWriter(dataArray, fileName);

end

