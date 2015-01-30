function [ outArray ] = ByteUnpacker( inArray )
%BYTEUNPACKER Double the size of an uint8 array by storing everything in
%the upper nibble
%   Detailed explanation goes here

if ~strcmp(class(inArray), 'uint8') %#ok<STISA>
    error('Invalid input array format');
end
outArray = uint8(zeros(numel(inArray), 1));

j = 0;
for i = 1:numel(inArray)
    j = j+1;
    outArray(j) = bitand(inArray(i), 240);
    j = j+1;
    outArray(j) = bitshift(inArray(i), 4);
end

end

