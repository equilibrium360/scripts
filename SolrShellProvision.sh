sudo apt-get update

echo "[vagrant provisioning] Installing Java..."
sudo apt-get -y install curl
sudo apt-get -y install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer
export JAVA_HOME="/usr/lib/jvm/java-7-oracle/jre"
#INSTALLING SOLR 4.8
curl -O http://www.interior-dsgn.com/apache/lucene/solr/4.8.0/solr-4.8.0.tgz
tar zxf solr-4.8.0.tgz
#Get complete path of file
readlink -f solr-4.8.0
export SOLR_INSTALL="/home/vagrant/solr-4.8.0
cd $SOLR_INSTALL/example 
java -jar start.jar
# To start Solr Server in Background
#nohup java -jar start.jar > output.log 2>&1 &
java -jar start.jar > log.txt 2>&1
#Get source code
curl -O http://www.manning.com/grainger/SolrinAction_SourceCode.zip
sudo apt-get install unzip

##########################
curl -O http://archive.apache.org/dist/lucene/solr/4.7.0/solr-4.7.0.tgz

#########STOP SOLR
java -DSTOP.PORT=8983 -DSTOP.KEY=mysecret -jar start.jar --stop

##################### GEOSPATIAL INDEX
cd $SOLR_IN_ACTION/example-docs/
java -Durl=http://localhost:8983/solr/geospatial/update -jar post.jar ch15/documents/geospatial.xml

############################################ CURL for REST API CALLS***************
curl -i -H "Accept: application/json" "http://localhost:8983/solr/geospatial/select?q=*:*&fq={!geofilt sfield=location pt=37.775,-122.419 d=20}"

geofilt
http://localhost:8983/solr/geospatial/select?q=*:*&fq={!geofilt sfield=location pt=37.775,-122.419 d=20}
