#!/bin/bash

echo "Downloading sonarqube"
VERSION=8.6.0.39681
curl -L0 https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-$VERSION.zip > sonar.zip

echo "Installing dependencies"
sudo apt-get update -y
sudo apt-get install -y unzip

echo "Unzipping sonarqube"
SONAR_HOME=/opt
rm -rf sonarqube-$VERSION
rm -rf sonarqube
unzip sonar.zip
mv sonarqube-$VERSION sonarqube
mv sonarqube $SONAR_HOME/

# Configure the OS
# https://docs.sonarqube.org/latest/requirements/requirements/
# Solve: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
sysctl -w vm.max_map_count=524288
sysctl -w fs.file-max=131072
ulimit -n 131072
ulimit -u 8192



# SonarQube cannot run as root (which is good)
sudo useradd sonar
sudo chown -R sonar:sonar /opt/sonarqube

echo "Installing OpenJDK 11"
sudo apt install -y openjdk-11-jre-headless

# Make SonarQube auto-start
SERVICE_FILE=/etc/systemd/system/sonarqube.service
cat > $SERVICE_FILE <<EOL
[Unit]
Description=SonarQube service
After=syslog.target network.target

[Service]
Type=simple
User=sonarqube
Group=sonarqube
PermissionsStartOnly=true
EOL

echo "ExecStart=/bin/nohup /opt/java/bin/java -Xms32m -Xmx32m -Djava.net.preferIPv4Stack=true -jar /opt/sonarqube/lib/sonar-application-$VERSION.jar" >> $SERVICE_FILE
cat >> $SERVICE_FILE <<EOL
StandardOutput=syslog
LimitNOFILE=131072
LimitNPROC=8192
TimeoutStartSec=5
Restart=always
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target
EOL

# Starting SonarQube service (require root)
systemctl enable sonarqube.servie
service sonarqube restart

chmod 644 $SERVICE_FILE