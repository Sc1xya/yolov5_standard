#!/bin/bash
export PROJECT_ROOT="$(pwd)"

sed "s|\${PROJECT_ROOT}|$PROJECT_ROOT|g" config/kitti_before.yaml > config/kitti.yaml

set -e
cd scripts && python train.py