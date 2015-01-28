# Matlab-Data-Video-Converter
Convert arbitrary binary files into a video.  

## Usage
- Converting a data file to video
```
  [dataLength] = VideoEncode( in_name, out_name )
```
This will generate "out_name_dataLength.avi", where "dataLength" is length of the original data. 
- Converting a video file to data
```
  [dataArray] = VideoDecode(videoName, fileName, dataLength )
```
This will generate a file with "fileName" using input video with the name "videoName", you need to supply the length of the original data, which is the "dataLength" variable. "dataArray" is the decoded data in an uint8 array. 

## Settings
You can change the settings of the encoded video file by modifying "settings.mat".
- BlockSizeI

This is the vertical block size.
- BlockSizeJ

This is the horizontal block size.
- FrameHeight

This is the height of each frame.
- FrameWidth

This is the width of each frame.
- Repeat

This specifies how many times each unique data frame is repeated. 
- VideoProfile

This specifies Matlab's VideoWriter class's video profile. For more information, please have a look at the documentation for [VideoWriter](http://uk.mathworks.com/help/matlab/ref/videowriter-class.html VideoWriter class) class on Matlab website. Please note that only lossless compression will allow data recovery
