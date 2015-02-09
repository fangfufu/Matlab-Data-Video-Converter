#!/bin/bash

BLOCK_SIZE=12
FRAME_WIDTH_MP4=1920
FRAME_HEIGHT_MP4=1080

FRAME_WIDTH=$(echo "${FRAME_WIDTH_MP4}/${BLOCK_SIZE}" | bc)
FRAME_HEIGHT=$(echo "${FRAME_HEIGHT_MP4}/${BLOCK_SIZE}" | bc)
DATA_FPS=60
VID_FPS=60

youtube-dl $1 -f 299 -o - | ffmpeg -y -i pipe:0 -r ${VID_FPS} -f rawvideo -pix_fmt monob -vf "scale=iw/${BLOCK_SIZE}:ih/${BLOCK_SIZE}" -video_size ${FRAME_WIDTH}x${FRAME_HEIGHT} -sws_flags neighbor -r ${DATA_FPS} pipe:1 | xz -d --stdout > $2
