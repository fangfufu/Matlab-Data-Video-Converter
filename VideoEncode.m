function [] = VideoEncode( in_name, out_name )
%VIDEOENCODE Convert a file into a video
%   Detailed explanation goes here
ArrayDumper(DataFramer(FileReader(in_name)), out_name);
end

