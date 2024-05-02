#!/bin/bash


# 接收多个文本参数，所有参数都是分支名称
# 1. 有参数的话，作为分支名称使用，删除本地和远程分支
# 2. 没有参数的话，则不进行操作
if [ $# -gt 0 ]; then
  for branch in "$@"; do
    git branch -d "$branch"
    git push origin --delete "$branch"
    echo "🚀 操作完成，$branch 分支删除完成"
  done
fi


