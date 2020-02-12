ansible all -m ping -i ./ansible/inventory
ansible all -a "name=git state=present" --become
