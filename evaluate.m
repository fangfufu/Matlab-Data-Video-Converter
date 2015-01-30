[~, inData, inFrame] = VideoEncode('LICENSE', 'license');
[outData, outFrame] = VideoDecode('license_70244.avi', 'license', 70244);
dataDiff = bitxor(inData, outData);
binDataDiff = dec2bin(dataDiff);
diffFrame = bitxor(inFrame, outFrame);