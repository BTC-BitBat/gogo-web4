#!/bin/bash
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
sudo yum install -y httpd

sudo sh -c 'cat >> /etc/httpd/conf/httpd.conf << EOF
<VirtualHost *:80> 
ServerName 56
ErrorLog logs/counterjp.fureweb.com-error_log 
ProxyRequests Off 
ProxyPreserveHost On 

<Proxy *> 
Order deny,allow 
Allow from all 
</Proxy> 

ProxyPass /petclinic http://172.16.2.4:8080/petclinic
ProxyPassMatch ^/(.*\.do)$ http://172.16.2.4:8080/ 
ProxyPassMatch ^/(.*\.jsp)$ http://172.16.2.4:8080/ 
ProxyPassReverse / http://172.16.2.4:8080/ 
</VirtualHost>
EOF'

sed -i 's/56/${pub_address}/g' /etc/httpd/conf/httpd.conf


sudo systemctl restart httpd
sudo systemctl enable httpd

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo
sudo yum install azure-cli -y 
az upgrade

az login -u ba091@btc3.onmicrosoft.com -p wldnd201@
az vm deallocate --resource-group azuregod --name azuregod_was
az vm generalize --resource-group azuregod --name azuregod_was

sudo yum remove azure-cli -y
sudo rm /etc/yum.repos.d/azure-cli.repo
MSFT_KEY=`rpm -qa gpg-pubkey /* --qf "%{version}-%{release} %{summary}\n" | grep Microsoft | awk '{print $1}'`
sudo rpm -e --allmatches gpg-pubkey-$MSFT_KEY

