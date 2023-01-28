#!/bin/bash
set -e

git config --global alias.b "checkout -b"
git config --global alias.br 'branch --format="%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]" --sort=-committerdate'
git config --global alias.cm "commit -m"
git config --global alias.co "checkout"
git config --global alias.d "diff"
git config --global alias.del "branch -D"
git config --global alias.done "push origin HEAD"
git config --global alias.l 'log --pretty=format:"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]" --abbrev-commit -30'
git config --global alias.last "log -1 HEAD --stat"
git config --global alias.ll "log --oneline"
git config --global alias.p "push"
git config --global alias.pushf "push --force-with-lease"
git config --global alias.res "reset --hard"
git config --global alias.rv "remote -v"
git config --global alias.s "status"
git config --global alias.save "!git add -A && git commit -m 'chore: savepoint'"
git config --global alias.st "status -sb"
git config --global alias.undo "reset HEAD~1 --mixed"
