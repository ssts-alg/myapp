#! /bin/bash


ansible all -m ping -i ./ansible/inventory
# ansible all -i ./ansible/inventory -m yum -a "name=git state=present" --become


cd ansible/
rm -rf ansible-modules || true
git clone https://${GIT_PRIVATE}@github.com/suresh-devops/ansible-modules.git
cd ansible-modules/
git checkout master
git pull origin master
cd ../../

if [ `echo $?` -eq 0 ]
then
   ansible-playbook -i ./ansible/inventory ./ansible/from_module.yml --become
else
   echo "Had some Problem in Connection"
fi
