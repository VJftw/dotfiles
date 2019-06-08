# VJ's Workspace Settings

## Ubuntu 17.10

### Gnome
```
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/gnome-setup.sh)
```

## Kernels

### Xanmod
```
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/xanmod.sh)
```

### Liqourix
```
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/liquorix.sh)
```

## Scripts
Export AWS Credentials from file
```
mkdir -p ~/.scripts
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/scripts/export-aws-credentials.sh -o ~/.scripts/export-aws-credentials.sh
```

#### Usage
```
source ~/.scripts/export-aws-credentials.sh ~/Downloads/accessKeys.csv
```

## Ansible

```
sudo add-apt-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible curl unzip
curl -LO https://github.com/VJftw/workspace-settings/archive/master.zip
rm -rf workspace-settings-master/
unzip master.zip
cd workspace-settings-master/
ansible-galaxy install -r requirements.yml
ansible-playbook playbook.yml
```
