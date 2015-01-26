# Used to access Spark across the VPN, since it's NAT'd
alias pyspark='SPARK_LOCAL_IP=`ifconfig tun0 | grep '"'"'inet addr:'"'"' | cut -d: -f2 | awk '"'"'{ print $1}'"'"'` pyspark'
alias spark-shell='SPARK_LOCAL_IP=`ifconfig tun0 | grep '"'"'inet addr:'"'"' | cut -d: -f2 | awk '"'"'{ print $1}'"'"'` spark-shell'
