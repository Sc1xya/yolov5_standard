#!/bin/bash
# 自动为所有空目录生成 .gitkeep
find . -type d -empty -exec touch {}/.gitkeep \;

echo "✅ 已为所有空目录添加 .gitkeep"
