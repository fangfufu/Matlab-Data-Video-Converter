function VideoToFile( in_name, out_name, len, repeat, bc_x, bc_y )
%VIDEOTOFILE Convert a video back into a file
%   VideoToFile( in_name, out_name, bc_x, bc_y )
%   Where   in_name is the input filename of the video
%           out_name is the output filename of the binary
%           len is the length of the binary file
%           repeat is the number of repeated frame for each unique frame
%           bc_x is the block count in horizontal direciton
%           bc_y is the bock count in the vertical direction

% File descriptors
reader_obj = VideoReader(in_name);
file_id = fopen(out_name, 'w');

% Bit per frame
bit_pf = bc_x * bc_y;

% Byte per frame
byte_pf = floor(bit_pf / 8);

% Bytes read so far
bytes_read = 0;

% Main loop
disp('Reading frames:');
disp('     ');
while hasFrame(reader_obj)
    old_bytes_read = bytes_read;
    bytes_read = bytes_read + byte_pf;
    tempFrame = uint32(zeros([reader_obj.Height reader_obj.Width 3]));
    for j = 1:repeat
        tempFrame = tempFrame + uint32(readFrame(reader_obj));
    end
    tempFrame = uint8(round(sum(tempFrame,3) ./ repeat ./3));
    block_frames = FrameToBlock(tempFrame, bc_x, bc_y);
    if bytes_read < len
        bytes = uint8(LogicalToByte(reshape(block_frames, [], 8)));
        fprintf('\b\b\b\b\b\b%05.2f%%', bytes_read/len*100);
    else
        bytes = uint8(LogicalToByte(reshape( ...
            block_frames(1:((len-old_bytes_read)*8)), [], 8)));
            fprintf('\b\b\b\b\b\b100%%');

    end
    fwrite(file_id, bytes);
end
disp(' ');

fclose(file_id);

end

