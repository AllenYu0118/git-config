#!/bin/bash

# 检查是否有文本参数
if [ $# -eq 1 ]; then
  git add .
  git commit -am "$1"
fi


