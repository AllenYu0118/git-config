#!/bin/bash

# 保存当前分支名称
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# 检查是否有文本参数，
# 1. 有参数的话，作为 commit message 使用，创建 commit 提交，提交到远程仓库
# 2. 没有参数的话，则不进行操作
if [ $# -eq 1 ]; then
  git add .
  git commit -am "$1"
  git push origin "$CURRENT_BRANCH"
fi

# 检查当前是否有未提交的更改
if [[ $(git status --porcelain) ]]; then
  echo "您有未提交的更改，请先提交或暂存更改。"
  exit 1
fi

# 切换到develop分支
git checkout develop

# 拉取最新的develop分支代码
git pull origin develop

# 合并之前的当前分支到develop，并使用默认的合并信息
git merge "$CURRENT_BRANCH" --no-edit

# 检查合并是否存在冲突
if [[ $(git status --porcelain) ]]; then
  echo "❗️合并存在冲突，请解决冲突后再进行操作。"
  exit 1
fi

# 提交最新的develop分支代码
git push origin develop

# 切换回原来的分支
git checkout "$CURRENT_BRANCH"

# 打印完成信息
echo "🚀 操作完成，${CURRENT_BRANCH} 分支代码已合并到 develop"