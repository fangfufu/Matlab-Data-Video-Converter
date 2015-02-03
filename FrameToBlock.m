function [ block_frame ] = FrameToBlock( frame, bc_x, bc_y )
%FRAMETOBLOCK Convert a frame into a logical block
%   [ block_frame ] = FrameToBlock( frame, bc_x, bc_y )

if ((ndims(frame) ~= 3) || ~isa(frame, 'uint8'))  
    error('Invalid input frame format');
end

bs_x = size(frame, 2) / bc_x;
bs_y = size(frame, 1) / bc_y;
block_frame = false(bc_y, bc_x);

for k = 1:3
    for j = 1:size(block_frame, 1)
        for i = 1:size(block_frame, 2)
            tmp = frame(ceil((j-1)*bs_y+1):floor(j*bs_y-1), ...
                ceil((i-1)*bs_x+1):floor(i*bs_x-1), k);
            block_frame(j, i, k) = mean(tmp(:)) > 127;
        end
    end
end


end

