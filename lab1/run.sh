#!/bin/bash
make
if [ $? -eq 0 ]; then
    ./main
else
    echo "Build failed."
fi