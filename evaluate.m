[~, inData, inFrame] = VideoEncode('LICENSE', 'license');
[outData, outFrame] = VideoDecode('license_35122.avi', 'license', 35122);
dataDiff = bitxor(inData, outData);
binDataDiff = dec2bin(dataDiff);
diffFrame = bitxor(inFrame, outFrame);