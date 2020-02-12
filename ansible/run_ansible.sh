ansible all -m ping -i ./ansible/inventory
# ansible all -i ./ansible/inventory -m yum -a "name=git state=present" --become
ansible-playbook -i ./ansible/inventory ./install/yml --become
