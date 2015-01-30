function [dataLength, dataArray, frameArray] = VideoEncode( in_name, out_name )
%VIDEOENCODE Convert a file into a video
%   Detailed explanation goes here
dataArray = FileReader(in_name);
[frameArray, dataLength] = DataFramer(ByteUnpacker(dataArray));
outname = strcat(out_name, '_', num2str(dataLength));
disp('Saving to');
disp(strcat(outname, '.avi'));
ArrayWriter(frameArray, outname);
end
