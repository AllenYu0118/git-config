# Git Config

## Usage

Open the .zshrc file, add this code

```shell
alias gmd='/Users/name/git-config/git-merge-develop.sh'
alias gnb='/Users/name/git-config/git-new-branch.sh'
alias gdb='/Users/name/git-config/git-delete-branch.sh'
```

## git-merge-develop
能够快速的把当前分支合并到开发分支（develop）中，合并完成后自动切回开发分支，合并有冲突时，需要解决冲突后，手动切回来

## git-new-branch.sh
从 master 新创建一个分支，且同步到远程仓库并关联。

## git-delete-branch
删除本地和远程相同名称的分支