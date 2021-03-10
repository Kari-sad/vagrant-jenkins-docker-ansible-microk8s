# Use vagrant to provision a development environment #

## Provisioned tools: Jenkins, Ansible, Docker, microk8s  ##

- download virtualbox [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
- download vagrant [https://www.vagrantup.com/downloads](https://www.vagrantup.com/downloads)

- Used box: [https://app.vagrantup.com/ubuntu/boxes/focal64](https://app.vagrantup.com/ubuntu/boxes/focal64)

### Procedure ###

    mkdir vagrant
    cd vagrant   
    vagrant box add ubuntu/focal64  
    vagrant init ubuntu/focal64  

Modify vagrantfile as per requirements
     
    vagrant up 
or   
   
    vagrant up --provision

**VM name & hostname:** devenv  
**VM ip address:** 192.168.0.20  
#### To access created VM ####
    vagrant ssh

#### To delete created VM ####

    vagrant destroy

#### Jenkins initial password ####
Jenkins initial password will be shown at the end of the provisioning process. 
