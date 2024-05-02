#!/bin/bash

# 检查当前是否有未提交的更改
if [[ $(git status --porcelain) ]]; then
  echo "您有未提交的更改，请先提交或暂存更改。"
  exit 1
fi

# 检查是否有文本参数
# 1. 有参数的话，作为分支名称使用，拉取最新的代码
# 2. 没有参数的话，则不进行操作
if [ $# -eq 1 ]; then
  git fetch origin master
  git checkout -b "$1" origin/master 
  git push -u origin "$1"

  # 打印完成信息
  echo "🚀 操作完成，$1 分支创建完成"
fi


