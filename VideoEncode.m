function [dataLength] = VideoEncode( in_name, out_name )
%VIDEOENCODE Convert a file into a video
%   Detailed explanation goes here
[dataArray, dataLength] = DataFramer(FileReader(in_name));
ArrayDumper(dataArray, strcat(out_name, '_', num2str(dataLength)));
end

