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

You can change the settings of the encoded video file by modifying "settings.mat".
