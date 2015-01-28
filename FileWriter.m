function [ ] = FileWriter( inArray, outFilename )
%FILEWRITER Write a binary file using an uint8 array
%   Detailed explanation goes here
if ~strcmp(class(inArray), 'uint8') %#ok<STISA>
    error('Invalid input array type.')
end

fileID = fopen(outFilename, 'w');
fwrite(fileID, inArray);
fclose(fileID);

end

