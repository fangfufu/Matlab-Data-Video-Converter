function VideoToFile( in_name, out_name, len, repeat, bc_x, bc_y )
%VIDEOTOFILE Convert a video back into a file
%   VideoToFile( in_name, out_name, bc_x, bc_y )
%   Where   in_name is the input filename of the video
%           out_name is the output filename of the binary
%           len is the length of the binary file
%           bc_x is the block count in horizontal direciton
%           bc_y is the bock count in the vertical direction

readerObj = VideoReader(in_name);
block_frames = false(bc_y, bc_x, ceil(len/(bc_x * bc_y)));

i = 0;
while hasFrame(readerObj)
    i = i + 1;
    tempFrame = double(zeros([readerObj.Height readerObj.Width 3]));
    for j = 1:repeat
        tempFrame = tempFrame + double(readFrame(readerObj));
    end
    tempFrame = rgb2gray(uint8(round(tempFrame ./ repeat)));
    block_frames(:,:,i) = FrameToBlock(tempFrame, bc_x, bc_y);
end

logicals = block_frames(1:len * 8);
logicals = reshape(logicals, len, 8); 
bytes = uint8(LogicalToByte(logicals));
FileWriter(bytes, out_name);



end

