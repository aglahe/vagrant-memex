#!/usr/bin/env bash
# create hadoop config files
#remove existing one 
sudo alternatives --remove hadoop-conf /etc/hadoop/conf.xdata
HDFS_COMPUTE_CONF=/etc/hadoop/conf.memex
sudo alternatives --install /etc/hadoop/conf hadoop-conf $HDFS_COMPUTE_CONF 60
