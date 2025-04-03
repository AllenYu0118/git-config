#!/bin/bash

# 检查当前是否有未提交的更改
if [[ $(git status --porcelain) ]]; then
  echo "您有未提交的更改，请先提交或暂存更改。"
  exit 1
fi

# 检查是否有文本参数
# 1. 有一个参数的话，作为分支名称使用，基于master分支拉取最新的代码
# 2. 有两个参数的话，第一个作为分支名称，第二个作为基础分支名称（替代master）
# 3. 没有参数的话，则不进行操作
if [ $# -ge 1 ]; then
  # 默认基础分支为master
  BASE_BRANCH="master"
  
  # 如果提供了第二个参数，则使用它作为基础分支
  if [ $# -eq 2 ]; then
    BASE_BRANCH="$2"
  fi

  git fetch origin "$BASE_BRANCH"
  git checkout -b "$1" origin/"$BASE_BRANCH" 
  git push -u origin "$1"

  # 打印完成信息
  echo "🚀 操作完成，$1 分支基于 $BASE_BRANCH 创建完成"
fi


