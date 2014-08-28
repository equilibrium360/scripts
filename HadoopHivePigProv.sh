sudo apt-get update

echo "[vagrant provisioning] Installing Java..."
sudo apt-get -y install curl
sudo apt-get -y install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer
export JAVA_HOME="/usr/lib/jvm/java-7-oracle/jre"
#Install PIG 
wget http://mirrors.ibiblio.org/apache/pig/stable/pig-0.12.1.tar.gz && tar xvzf pig-0.12.1.tar.gz && rm pig-0.12.1.tar.gz
#Install HIVE
wget http://apache.tradebit.com/pub/hive/stable/apache-hive-0.13.0-bin.tar.gz && tar xvzf apache-hive-0.13.0-bin.tar.gz && rm apache-hive-0.13.0-bin.tar.gz
