function [length, bc_x, bc_y] = FileToVideo(in_name, out_name, ...
    dim_x, dim_y, bs_x, bs_y)
%LOGICALTOVIDEO Writre a logical array file to Video
%   [ file_length, frames ] = LogicalToVideo(logicals, dim_x, dimy_y)
%   where logicals is the input array, dim_x is the video's width, dim_y 
%   is the video's height, block_x is the width of each block, block_y is 
%   the height of each block

% Preprocess input data
in_data = FileReader(in_name);
in_logical = ByteToLogical(in_data);

% This is how many bytes we have saved in the output video. It is required
% during recovery
length = size(in_logical, 1);

% Start output frame writer
writerObj = VideoWriter(out_name);
open(writerObj);

% Block count for each frame
bc_x = floor(dim_x / bs_x);
bc_y = floor(dim_y / bs_y);
bc_f = bc_x * bc_y;

% Setup block diagram for each frame
frame_count = ceil(numel(in_logical) / bc_f);
block_frames = false(bc_y, bc_x, frame_count);
block_frames(1:numel(in_logical)) = in_logical(:);

% Setup an output frame
for i = 1:frame_count
    out_frame = BlockToFrame(block_frames(:,:,i), bs_x, bs_y);
    writeVideo(writerObj, out_frame);
end
close(writerObj);

fprintf('Output file parameters:\n length: %d , bc_x: %d, bc_y: %d\n', ...
    length, bc_x, bc_y);

end

