function [ data_array ] = FileReader( input_filename )
%FILEREADER Read a binary file in uint8 format
%   Detailed explanation goes here
file = fopen(input_filename, 'r');
data_array = fread(file, 'uint8=>uint8');
end

