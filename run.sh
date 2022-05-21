whereami=$(dirname "$0")
cd "$whereami"

sudo systemctl stop fprintd
ansible-playbook -K framework.yaml
sudo systemctl start fprintd
