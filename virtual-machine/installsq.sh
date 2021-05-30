# https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-ver15

# wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# # sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2019.list)"

# sudo apt-get update
# sudo apt-get install -y mssql-server

# sudo /opt/mssql/bin/mssql-conf setup

# systemctl status mssql-server --no-pager

echo "Downloading sonarqube"
curl -L0 https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.6.0.39681.zip > sonar.zip
echo "Unzipping sonarqube"
unzip sonar.zip

echo "Installing OpenJDK 11"
sudo apt install -y openjdk-11-jre-headless

