function [dataArray] = VideoEncode( in_name )
%VIDEOENCODE Convert a file into a video
%   Detailed explanation goes here
[dataArray, dataLength] = DataFramer(FileReader(in_name));
ArrayDumper(dataArray, strcat(in_name, '_', num2str(dataLength)));
end

