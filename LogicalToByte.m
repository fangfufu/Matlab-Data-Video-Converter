function [ bytes ] = LogicalToByte( logicals )
%LogicalToByte Convert a logical array into a byte array
%   Detailed explanation goes here

if ~islogical(logicals)
    error('Invalid input data type.');
end

if size(logicals, 2) ~= 8
    error('Invalid input data format.');
end

bytes = zeros(size(logicals, 1), 1);

for i = 1:numel(bytes)
    for j = 1:8
        bytes(i) = bitor(bytes(i), bitshift(uint8(logicals(i, 8-j+1)), ...
            j-1));
    end
end

end

