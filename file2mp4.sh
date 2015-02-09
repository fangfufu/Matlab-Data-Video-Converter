#!/bin/bash

BLOCK_SIZE=16
FRAME_WIDTH_MP4=1920
FRAME_HEIGHT_MP4=1080

FRAME_WIDTH=$(echo "${FRAME_WIDTH_MP4}/${BLOCK_SIZE}" | bc)
FRAME_HEIGHT=$(echo "${FRAME_HEIGHT_MP4}/${BLOCK_SIZE}" | bc)
DATA_FPS=60
VID_FPS=60

FILE_SIZE=$(stat -c%s "$1")
NEXT_SIZE=$(echo "($FRAME_WIDTH*$FRAME_HEIGHT)" | bc)
{ xz -1 -k $1 --stdout; dd if=/dev/zero bs=$NEXT_SIZE count=1; } | ffmpeg -y -f rawvideo -pix_fmt monob -video_size ${FRAME_WIDTH}x${FRAME_HEIGHT} -r ${DATA_FPS} -i "pipe:0" -vf scale=iw*${BLOCK_SIZE}:ih*${BLOCK_SIZE} -sws_flags neighbor -r ${VID_FPS} -pix_fmt yuv420p -preset fast "$2"
