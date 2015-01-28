function [] = ArrayDumper( inArray, outName )
%ARRAYDUMPER Dump an array to file
%   Please use 1080x1920xn array.
Repeat = 30;
if size(inArray, 1) ~= 1080 || size(inArray, 2) ~= 1920
    error('Invalid array dimension');
end;
writerObj = VideoWriter(outName);
open(writerObj);

disp('Writing Frames');
disp('     ');
UniqueFrameCount = size(inArray, 4);
for i = 1 : UniqueFrameCount
    fprintf('\b\b\b\b\b\b%05.2f%%', i/UniqueFrameCount*100);
    for j = 1 : Repeat
        writeVideo(writerObj, inArray(:,:,:,i));
    end
end
disp(' ');
close(writerObj);
end

