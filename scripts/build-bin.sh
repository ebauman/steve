#!/bin/bash

echo "Building for GOOS ${INPUT_GOOS} and GOARCH ${INPUT_GOARCH}"

mkdir -p dist/

for os in $(echo $INPUT_GOOS | tr ',' '\n')
do
  for arch in $(echo $INPUT_GOARCH | tr ',' '\n')
  do
    echo "Building for ${os}/${arch}"
    CGO_ENABLED=0 GOOS=$os GOARCH=$arch go build -ldflags "-extldflags -static -s" -o dist/steveui-$os-$arch
  done
done