#!/usr/bin/env bash

# Get the Extra repos installed
sudo rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -Uvh http://archive.cloudera.com/cdh5/one-click-install/redhat/6/x86_64/cloudera-cdh-5-0.x86_64.rpm

# Get some basics going
sudo yum -y install wget
sudo yum -y install docker-io
sudo yum -y install java-1.7.0-openjdk-devel
sudo yum -y install hadoop-client
sudo yum -y install bind-utils
sudo yum -y install vpnc
sudo yum -y groupinstall 'Development Tools'
sudo yum -y install ncsd

# Do an update
sudo yum -y update

# Spark
sudo yum -y install spark-core
sudo yum -y install spark-python

# HBase
sudo yum -y install hbase

# Hive
sudo yum -y install hive
sudo yum -y install hive-jdbc
sudo yum -y install hive-hbase
sudo yum -y install hive-hcatalog

# Impala
sudo yum -y install impala
sudo yum -y install impala-shell

# Pig
sudo yum -y install pig

# Zookeeper client
sudo yum -y install zookeeper

# Sqoop
sudo yum -y install sqoop

# Setup software DIR
sudo mkdir -p /srv/software

# Solr, aka Cloudera Search
sudo yum -y install solr
sudo yum -y install solr-mapreduce
sudo yum -y install solr-crunch
sudo ln -s /etc/default/solr /etc/solr/default

# Storm
sudo wget https://github.com/apache/storm/archive/v0.9.3.tar.gz
sudo /bin/tar xzvf v0.9.3.tar.gz -C /srv/software
sudo ln -s /srv/software/storm-0.9.3 /srv/software/storm
sudo mkdir -p /var/log/storm
sudo rm -rf /srv/software/storm/conf
sudo ln -s /var/log/storm /srv/software/storm/logs
sudo ln -s /etc/storm/conf /srv/software/storm/conf
sudo mkdir -p /tmp/storm/local

# Get Scala 2.11.5
sudo wget http://www.scala-lang.org/files/archive/scala-2.11.5.tgz
sudo /bin/tar xzvf scala-2.11.5.tgz -C /usr/lib
sudo ln -s /usr/lib/scala-2.11.5 /usr/lib/scala
sudo echo "export PATH=\$PATH:/usr/lib/scala/bin\nexport SCALA_HOME=/usr/lib/scala" >> /etc/profile.d/scala.sh

# Get MiniConda
sudo wget http://repo.continuum.io/miniconda/Miniconda-3.7.0-Linux-x86_64.sh
sudo /bin/chmod 755 ./Miniconda-3.7.0-Linux-x86_64.sh
sudo ./Miniconda-3.7.0-Linux-x86_64.sh -b -p /srv/software/anaconda
sudo echo "export PATH=/srv/software/anaconda/bin:\$PATH" >> /etc/profile.d/anaconda.sh
sudo /srv/software/anaconda/bin/conda update --yes conda
sudo /srv/software/anaconda/bin/conda install --yes ipython

# create hadoop config files
HDFS_COMPUTE_CONF=/etc/hadoop/conf.memex
alternatives --install /etc/hadoop/conf hadoop-conf $HDFS_COMPUTE_CONF 60

# Add the Hadoop Lzo
sudo wget -P /etc/yum.repos.d http://archive-primary.cloudera.com/gplextras5/redhat/6/x86_64/gplextras/cloudera-gplextras5.repo
sudo yum -y install hadoop-lzo
