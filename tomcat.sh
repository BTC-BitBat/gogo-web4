#!/bin/bash
sudo apt update
sudo apt install default-jdk -y
sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.56/bin/apache-tomcat-9.0.56.tar.gz -P /tmp
sudo tar xf /tmp/apache-tomcat-9*.tar.gz -C /opt/tomcat
sudo ln -s /opt/tomcat/apache-tomcat-9.0.56 /opt/tomcat/latest
sudo chown -RH tomcat: /opt/tomcat/latest
sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'
sudo sh -c 'cat > /etc/systemd/system/tomcat.service <<EOF
[Unit]
Description=Tomcat 9 servlet container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/default-java"
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom -Djava.awt.headless=true"

Environment="CATALINA_BASE=/opt/tomcat/latest"
Environment="CATALINA_HOME=/opt/tomcat/latest"
Environment="CATALINA_PID=/opt/tomcat/latest/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

ExecStart=/opt/tomcat/latest/bin/startup.sh
ExecStop=/opt/tomcat/latest/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
EOF'
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl enable tomcat
sudo ufw allow 8080/tcp

#user name 넣는방법
sudo sed -i '/<tomcat-users/i\<!--' /opt/tomcat/latest/conf/tomcat-users.xml
sudo sed -i '/version="1.0">/a\-->' /opt/tomcat/latest/conf/tomcat-users.xml
sudo sed -i '$d' /opt/tomcat/latest/conf/tomcat-users.xml
sudo sh -c 'cat >> /opt/tomcat/latest/conf/tomcat-users.xml << EOF
<tomcat-users>
    <role rolename="manager-script"/>
    <role rolename="manager-gui"/>
    <role rolename="manager-jmx"/>
    <role rolename="manager-status"/>
    <user username="tomcat" password="tomcat" roles="manager-gui,manager-script,manager-status,manager-jmx"/>
</tomcat-users>
EOF'

# manager 앱, host manager 앱에서 파일 수정
sudo sed -i '/<CookieProcessor/i\<!--' /opt/tomcat/latest/webapps/manager/META-INF/context.xml
sudo sed -i '/<\/Context>/i\-->' /opt/tomcat/latest/webapps/manager/META-INF/context.xml

sudo sed -i '/<CookieProcessor/i\<!--' /opt/tomcat/latest/webapps/host-manager/META-INF/context.xml
sudo sed -i '/<\/Context>/i\-->' /opt/tomcat/latest/webapps/host-manager/META-INF/context.xml

sudo systemctl restart tomcat

# tomcat 배포 ( H2 In-memory Database 활용 )
git clone https://github.com/SteveKimbespin/petclinic_btc.git
#sudo mv /var/lib/waagent/custom-script/download/0/petclinic_btc /home/nana
cd petclinic_btc
./mvnw tomcat7:deploy

#MYSQL 배포설정 바꾸기
sudo sed -i 's/\[Change Me\]/jw-db.mysql.database.azure.com/' pom.xml
sudo sed -i 's/root/rara@jw-db/' pom.xml
sudo sed -i '529 s/petclinic/tlswldnd123@/' pom.xml

./mvnw tomcat7:redeploy -P MySQL

sudo apt-get install mysql-server -y
sudo ufw allow mysql
sudo systemctl start mysql
sudo systemctl enable mysql

sudo systemctl restart tomcat
