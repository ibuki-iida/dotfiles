#!/usr/bin/env bash

main() {
  local image=$1
  local color=${2:-a0a8a9}
  local borderWeight=${3:-10}
  local width=$(sips -g pixelWidth $1 | awk -F ' ' '{print $2}')
  local height=$(sips -g pixelHeight $1 | awk -F ' ' '{print $2}')
  local borderWidth=$(expr $width + $borderWeight)
  local borderHeight=$(expr $height + $borderWeight) 
  sips -p $borderHeight $borderWidth --padColor $color $image -o border_${image}
}
main
