function [len, bc_x, bc_y] = FileToVideo(in_name, out_name, ...
    dim_x, dim_y, repeat, bs_x, bs_y)
%FILETOVIDEO Convert a file into a video
%   [len, bc_x, bc_y] = FileToVideo(in_name, out_name, ...
%   dim_x, dim_y, bs_x, bs_y)
%   Where   in_name is the input filename an arbitary binary file, 
%           out_name is the output filename of the video,
%           dim_x is the desired width of the video,
%           dim_y is the desired height of the video,
%           repeat is the number of repeated frame,
%           bs_x is the horizontal block size of the video,
%           bs_y is the vertical block size of the video.

% File descriptor
file_id = fopen(in_name, 'r');
file_stat = dir(in_name);
len = file_stat.bytes;
writer_obj = VideoWriter(out_name);
open(writer_obj);

% Block count for each frame
bc_x = floor(dim_x / bs_x);
bc_y = floor(dim_y / bs_y);

% Bit per frame
bit_pf = bc_x * bc_y;

% Byte per frame
byte_pf = floor(bit_pf / 8);

% Buffers
block_frames = false(bc_y, bc_x); 

% Main loop
disp('Outputting frames:');
disp('     ');
while ~feof(file_id)
    in_data = fread(file_id, byte_pf, 'uint8=>uint8');
    in_logical = ByteToLogical(in_data);
    block_frames(1:numel(in_logical)) = in_logical(:);
    out_frame = BlockToFrame(block_frames, bs_x, bs_y);
    for i = 1:repeat
        writeVideo(writer_obj, out_frame);
    end
    fprintf('\b\b\b\b\b\b%05.2f%%', ftell(file_id)/len*100);
end
close(writer_obj);
disp(' ');

fprintf('Output file parameters:\n len: %d, repeat: %d, bc_x: %d, bc_y: %d\n', ...
    len, repeat, bc_x, bc_y);

end

