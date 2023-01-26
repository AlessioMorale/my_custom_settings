#!/bin/bash
set -e

git config --global alias.s "status"
git config --global alias.co "checkout"
git config --global alias.b "checkout -b"
git config --global alias.del "branch -D"
git config --global alias.br 'branch --format="%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]" --sort=-committerdate'
git config --global alias.save "!git add -A && git commit -m 'chore: savepoint'"
git config --global alias.pushf "push --force-with-lease"
git config --global alias.undo "reset HEAD~1 --mixed"
git config --global alias.res "!git reset --hard"
git config --global alias.done "!git push origin HEAD"
git config --global alias.l '!git log --pretty=format:"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]" --abbrev-commit -30'