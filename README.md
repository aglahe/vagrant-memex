# vagrant-memex
DARPA MEMEX project Vagrant VM

Notes:
Since the Guest OS is behind a NAT, there are two global aliases set, to help with Spark on the VPN.  It sets the SPARK_LOCAL_IP using the tun0 interface as the IP address.

To turn off for pyspark:
unalias pyspark

To turn off for spark-shell:
unalias spark-shell
