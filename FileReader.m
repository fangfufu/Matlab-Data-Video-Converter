function [ outArray ] = FileReader( inFilename )
%FILEREADER Read a binary file in uint8 format
%   Detailed explanation goes here
fileID = fopen(inFilename, 'r');
outArray = fread(fileID, 'uint8=>uint8');
fclose(fileID);
end

