ansible all -m ping -i ./ansible/inventory
# ansible all -i ./ansible/inventory -m yum -a "name=git state=present" --become
if [$? == 0]
then
    ansible-playbook -i ./ansible/inventory ./ansible/install.yml --become
else
  echo ("Had some Problem in Connection")
fi
