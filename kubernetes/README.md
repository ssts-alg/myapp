Installation Steps in Jenkins


1. `sudo pip3 install awscli`
2. Get AWS access key and Secret access key.
3. curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
```
  chmod +x ./kubectl
  sudo mv ./kubectl /usr/local/bin
  kubectl version --client
  ```
4. Download kube config file.
