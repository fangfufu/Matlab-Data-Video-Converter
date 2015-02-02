function [ logicals ] = ByteToLogical( bytes )
%ByteToLogical Convert a byte array into a logical array
%   Conversion is done by bitshifting and AND operation. 

if ~isa(bytes, 'uint8')
    error('Invalid input data type.');
end

logicals = false(numel(bytes), 8);

for i = 1:numel(bytes)
    for j = 1:8
        logicals(i, j) = bitand(bitshift(bytes(i), j-1), 128);
    end
end

end

