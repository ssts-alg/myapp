ansible all -m ping -i ./ansible/inventory
ansible all -i ./ansible/inventory -a "name=git state=present" --become
