function [ outArray ] = BytePacker( inArray )
%BYTEPACKER Convert an expanded uint8 array back into the original array
%   Detailed explanation goes here

if ~strcmp(class(inArray), 'uint8') || rem(numel(inArray), 2) %#ok<STISA>
    error('Invalid input array format');
end
outArray = uint8(zeros(numel(inArray)/2, 1));

j = 0;
for i = 1:numel(outArray)
    j = j + 1;
    outArray(i) = inArray(j);
    j = j + 1;
    outArray(i) = bitor(outArray(i), bitshift(inArray(j), -4));
end
end

