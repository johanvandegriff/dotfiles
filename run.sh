#!/bin/bash
which ansible > /dev/null || \
sudo pacman -Syy ansible || \
sudo apt install ansible || \
sudo dnf install ansible || \
sudo yum install ansible || \
python -m pip install --user ansible

whereami=$(dirname "$0")
cd "$whereami"

file="$1"
if [[ ! -f "$file" ]]; then
  file="${1}.yaml"
  if [[ ! -f "$file" ]]; then
    options=`ls -1 *.yaml`
    if [[ `echo "$options" | wc -l` -eq 1 ]]; then
      file="$options"
    else
      echo "select a file by typing the number next to it:"
      echo "$options" | cat -n
      read selection
      file=`echo "$options" | head -$selection | tail -1`
    fi
  fi
fi
echo "running $file"

sudo systemctl stop fprintd
ANSIBLE_NOCOWS=1 ansible-playbook -K "$file"
sudo systemctl start fprintd
