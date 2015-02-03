function [ frame ] = BlockToFrame( block_frame, bs_x, bs_y)
%BLOCKTOFRAME Convert a input logical block into a frame
%   [ frame ] = BlockToFrame( block_diag )

if ndims(block_frame) ~= 3
    error('Invalid input block frame dimension.');
end

frame = uint8(zeros(size(block_frame, 1) * bs_y, ...
    size(block_frame, 2) * bs_x, 3));

for k = 1:3
    for j = 1:size(block_frame, 1)
        for i = 1:size(block_frame, 2)       
            frame(((j-1)*bs_y+1):(j*bs_y), ((i-1)*bs_x+1):(i*bs_x), ...
                k) = uint8(block_frame(j, i, k) * 255);
        end
    end
end


end

