     #!/bin/bash
     #VAGRANT_HOST_DIR=/mnt/host_machine
     
     apt-get install update
     apt-get install openssh-server
     apt install net-tools -y
     
     #install Microk8s
     echo "installing Microk8s"
     apt-get install -y snapd 
     snap install microk8s --classic
     microk8s start
     sudo usermod -a -G microk8s vagrant
     sudo chown -f -R vagrant ~/.kube
     
     microk8s enable dns dashboard storage
     
     #install ansible
     echo "installing ansible"
     apt-add-repository ppa:ansible/ansible  
     apt-get update  
     apt-get install -y ansible 
 
     #install docker
     echo "Installing Docker"
     apt-get install -y apt-transport-https ca-certificates curl software-properties-common
     curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
     add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
     apt-get update
     apt-get install -y docker-ce
     sudo systemctl enable docker
     sudo usermod -aG docker ${USER}
     sudo usermod -aG docker jenkins
     sudo usermod -aG docker ubuntu
     
     #install java and jenkins
     echo "installing java and jenkins"
     apt-get install -y openjdk-8-jdk
     wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
     echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee -a /etc/apt/sources.list
     apt-get update  
     apt-get install -y jenkins
     echo "Jenkins initial password"
     sudo cat /var/lib/jenkins/secrets/initialAdminPassword     
     