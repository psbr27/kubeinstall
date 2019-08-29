# Update the package index
sudo apt-get update
# Update packages required for HTTPS package repository access
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Configure the stable Docker release repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# Update the package index to include the stable Docker repository
sudo apt-get update
# Install Docker
sudo apt-get install -y docker-ce=17.03.2~ce-0~ubuntu-xenial

docker --version

 
#Install kubeadm, kubectl, and kubelet from the official Kubernetes package repository:
# Add the Google Cloud packages GPG key
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# Add the Kubernetes release repository
sudo add-apt-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
# Update the package index to include the Kubernetes repository
sudo apt-get update
# Install the packages
sudo apt-get install -y kubeadm=1.13.4-00 kubelet=1.13.4-00 kubectl=1.13.4-00 kubernetes-cni=0.6.0-00
# Prevent automatic updates to the installed packages
sudo apt-mark hold kubelet kubeadm kubectl
#kubelet version
kubeadm version



echo "CALICO NETWORK"
kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
