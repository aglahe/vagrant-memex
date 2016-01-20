#!/usr/bin/env bash

# Get the Extra repos installed
sudo rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -Uvh http://archive.cloudera.com/cdh5/one-click-install/redhat/6/x86_64/cloudera-cdh-5-0.x86_64.rpm

# Do an update
sudo yum -y update

# Get some basics going
sudo yum -y groupinstall 'Development Tools'
sudo yum -y install bind-utils vpnc nscd wget java-1.8.0-openjdk-devel

# CDH Tools 
sudo wget -P /etc/yum.repos.d http://archive-primary.cloudera.com/gplextras5/redhat/6/x86_64/gplextras/cloudera-gplextras5.repo
sudo yum -y install hadoop-client hadoop-lzo spark-core spark-python hbase hive hive-jdbc hive-hbase hive-catalog install impala impala-shella pig zookeeper sqoop

# Setup software DIR
sudo mkdir -p /srv/software

# Kafka
sudo wget -q -O - http://apache.mirrors.hoobly.com/kafka/0.9.0.0/kafka_2.11-0.9.0.0.tgz | tar -xzf - -C /opt
sudo ln -s /opt/kafka_2.11-0.9.0.0 /opt/kafka
sudo rm -rf /opt/kafka/config
sudo ln -s /etc/kafka/conf /opt/kafka/config
sudo echo "export PATH=\$PATH:/opt/kafka/bin" >> /etc/profile.d/kafka.sh

# Spark 1.6
sudo wget -q -O - http://d3kbcqa49mib13.cloudfront.net/spark-1.6.0-bin-hadoop2.6.tgz | tar -xzf - -C /opt
sudo ln -s /opt/spark-1.6.0-bin-hadoop2.6 /opt/spark
sudo rm -rf /opt/spark/conf

# Get Scala 2.11.5
sudo wget http://www.scala-lang.org/files/archive/scala-2.11.7.tgz
sudo /bin/tar xzvf scala-2.11.7.tgz -C /usr/lib
sudo ln -s /usr/lib/scala-2.11.7 /usr/lib/scala
sudo echo "export PATH=\$PATH:/usr/lib/scala/bin\\nexport SCALA_HOME=/usr/lib/scala" >> /etc/profile.d/scala.sh

# Get MiniConda
sudo wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
sudo /bin/chmod 755 ./Miniconda-latest-Linux-x86_64.sh
sudo ./Miniconda-latest-Linux-x86_64.sh -b -p /srv/software/anaconda
sudo echo "export PATH=/srv/software/anaconda/bin:\$PATH" >> /etc/profile.d/anaconda.sh
sudo /srv/software/anaconda/bin/conda update --yes conda
sudo /srv/software/anaconda/bin/conda install --yes ipython
sudo /srv/software/anaconda/bin/conda install --yes ipython-notebook
