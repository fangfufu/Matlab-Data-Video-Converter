# Matlab-Data-Video-Converter
## IMPORTANT UPDATES ##
There are some important updates - you don't have to use Matlab to convert the data. You can use ffmpeg. Please submit all your questions, suggestions and pull request to https://github.com/fangfufu/Converting-Arbitrary-Data-To-Video

These shell scripts were originally designed by raedwulf (https://github.com/raedwulf). He couldn't be bothered to upload them. 

## Introduction ##
Convert arbitrary binary files into a video. 

Example output: https://www.youtube.com/watch?v=Zz_jMKZOeBg

Note, that parameter that achieves the highest data rate appears to be bs_x = 8, bs_y = 8, repeat = 2. If you set the parameter higher than that, Youtube refuse to accept the video. 

Please note that there is release version available for people without Matlab, although you do have to install Matlab Runtime Environment, which is available for free. The installer will install Matlab Runtime Environment for you automatically. 

## Usage
- Converting a data file to video
```
%FILETOVIDEO Convert a file into a video
%   [len, bc_x, bc_y] = FileToVideo(in_name, out_name, ...
%   dim_x, dim_y, bs_x, bs_y)
%   Where   in_name is the input filename an arbitrary binary file, 
%           out_name is the output filename of the video,
%           dim_x is the desired width of the video,
%           dim_y is the desired height of the video,
%           repeat is the number of repeated frame,
%           bs_x is the horizontal block size of the video,
%           bs_y is the vertical block size of the video.
```
- Converting a video file to data
```
%VIDEOTOFILE Convert a video back into a file
%   VideoToFile( in_name, out_name, bc_x, bc_y )
%   Where   in_name is the input filename of the video
%           out_name is the output filename of the binary
%           len is the length of the binary file
%           repeat is the number of repeated frame for each unique frame
%           bc_x is the block count in horizontal direciton
%           bc_y is the bock count in the vertical direction
```


