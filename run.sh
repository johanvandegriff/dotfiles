whereami=$(dirname "$0")
cd "$whereami"

sudo systemctl stop fprintd
ANSIBLE_COW_SELECTION=tux ansible-playbook -K "$1".yaml
sudo systemctl start fprintd
