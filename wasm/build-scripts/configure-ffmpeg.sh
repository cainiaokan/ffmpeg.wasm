#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
  --disable-network
  --disable-devices
  --enable-small
  --disable-muxers
  --disable-demuxers
  --disable-encoders
  --disable-decoders
  
  --enable-muxer=mp3,flv,mov,mp4,pcm_s16le,wav
  --enable-demuxer=aac,flac,flv,mov,mp4,mp3,ogg,pcm_s16le,wav
  --enable-encoder=aac,libmp3lame,pcm_s16le,wavpack
  --enable-decoder=aac,alac,flac,libmp3lame,opus,libopus,vorbis,libvorbis,pcm_s16le,wavpack
  --enable-protocol=file
  
  # --enable-gpl            # required by x264
  --enable-nonfree        # required by fdk-aac
  --enable-zlib           # enable zlib
  # --enable-libx264        # enable x264
  # --enable-libx265        # enable x265
  # --enable-libvpx         # enable libvpx / webm
  --enable-libwavpack     # enable libwavpack
  --enable-libmp3lame     # enable libmp3lame
  --enable-libfdk-aac     # enable libfdk-aac
  # --enable-libtheora      # enable libtheora
  --enable-libvorbis      # enable libvorbis
  # --enable-libfreetype    # enable freetype
  --enable-libopus        # enable opus
  # --enable-libwebp        # enable libwebp
  # --enable-libass         # enable libass
  # --enable-libfribidi     # enable libfribidi
  # --enable-libaom         # enable libaom
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"
EM_PKG_CONFIG_PATH=${EM_PKG_CONFIG_PATH} emconfigure ./configure "${FLAGS[@]}"
