#!/bin/bash

BLOCK_SIZE=16
FRAME_WIDTH_MP4=1920
FRAME_HEIGHT_MP4=1080

FRAME_WIDTH=$(echo "${FRAME_WIDTH_MP4}/${BLOCK_SIZE}" | bc)
FRAME_HEIGHT=$(echo "${FRAME_HEIGHT_MP4}/${BLOCK_SIZE}" | bc)
DATA_FPS=60
VID_FPS=60

ffmpeg -y -i "$1" -r ${VID_FPS} -f rawvideo -pix_fmt monow -vf "scale=iw/${BLOCK_SIZE}:ih/${BLOCK_SIZE}" -video_size ${FRAME_WIDTH}x${FRAME_HEIGHT} -sws_flags neighbor -r ${DATA_FPS} $2 | xz -d --stdout > $2
