function [len, bc_x, bc_y] = FileToVideo(in_name, out_name, ...
    dim_x, dim_y, repeat, bs_x, bs_y)
%FILETOVIDEO Convert a file into a video
%   [len, bc_x, bc_y] = FileToVideo(in_name, out_name, ...
%   dim_x, dim_y, bs_x, bs_y)
%   Where   in_name is the input filename an arbitary binary file, 
%           out_name is the output filename of the video,
%           repeat is the number of repeated frame,
%           dim_x is the desired width of the video,
%           dim_y is the desired height of the video,
%           bs_x is the horizontal block size of the video,
%           bs_y is the vertical block size of the video.

% Preprocess input data
in_data = FileReader(in_name);
in_logical = ByteToLogical(in_data);

% This is how many bytes we have saved in the output video. It is required
% during recovery
len = size(in_logical, 1);

% Start output frame writer
writerObj = VideoWriter(out_name);
open(writerObj);

% Block count for each frame
bc_x = floor(dim_x / bs_x);
bc_y = floor(dim_y / bs_y);

% Setup block diagram for each frame
frame_count = ceil(numel(in_logical) / (bc_x * bc_y));
block_frames = false(bc_y, bc_x, frame_count);
block_frames(1:numel(in_logical)) = in_logical(:);

% Setup an output frame
disp('Outputting frames:');
disp('     ');
for i = 1:frame_count
    out_frame = BlockToFrame(block_frames(:,:,i), bs_x, bs_y);
    for j = 1:repeat
        writeVideo(writerObj, out_frame);
    end
    fprintf('\b\b\b\b\b\b%05.2f%%', i/frame_count*100);
end
disp(' ');
close(writerObj);

fprintf('Output file parameters:\n len: %d , bc_x: %d, bc_y: %d\n', ...
    len, bc_x, bc_y);

end

