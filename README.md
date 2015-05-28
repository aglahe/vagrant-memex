# vagrant-memex
DARPA MEMEX project Vagrant VM

Notes:
Since the Guest OS is behind a NAT, we set the SPARK_LOCAL_IP using the tun0 interface as the IP address.  This is done in the spark-env.sh file

Please make sure that vbguest is installed (https://github.com/dotless-de/vagrant-vbguest/).  It helps keep the VirtuaalBoxGuestAdditions up to date, install on the cmd line:

vagrant plugin install vagrant-vbguest

When starting this on Linux, do not use your distribution's Vagrant package to install vagrant. Install from Vagrantup.com to ensure you're using the latest version of Vagrant. Using old versions of Vagrant will result in errors.


Troubleshooting on Spark:
"ERROR GPLNativeCodeLoader: Could not load native gpl library"
	Specify native hadoop libary by restarting the spark shell with this command: spark-shell --driver-library-path /usr/lib/hadoop/lib/native

"java.lang.IllegalArgumentException: java.net.UnknownHostException: XXX"
	There is an issue with the file path. You can access HDFS files using either the Spark Standalone method or utilize the YARN framework.
	Spark Standalone: var textFile = sc.textFile(hdfs://memex/dir/...)
	YARN: var textFile = sc.textFile(dir/...)
	** where dir is the desired directory name


