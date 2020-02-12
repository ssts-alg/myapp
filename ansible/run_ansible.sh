ansible all -m ping -i ./ansible/inventory
# ansible all -i ./ansible/inventory -m yum -a "name=git state=present" --become

cd ansible/
git clone git@github.com:suresh-devops/ansible-modules.git
cd ansible-modules/
git checkout master
git pull origin master
cd ../../



if [ `echo $?` -eq 0 ]
then
   ansible-playbook -i ./ansible/inventory ./ansible/install.yml --become
else
   echo "Had some Problem in Connection"
fi
