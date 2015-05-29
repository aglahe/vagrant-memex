# vagrant-memex
DARPA MEMEX project Vagrant VM

Notes:
Since the Guest OS is behind a NAT, we set the SPARK_LOCAL_IP using the tun0 interface as the IP address.  This is done in the spark-env.sh file

Please make sure that vbguest is installed (https://github.com/dotless-de/vagrant-vbguest/).  It helps keep the VirtuaalBoxGuestAdditions up to date, install on the cmd line:

vagrant plugin install vagrant-vbguest

When starting this on Linux, do not use your distribution's Vagrant package to install vagrant. Install from Vagrantup.com to ensure you're using the latest version of Vagrant. Using old versions of Vagrant will result in errors.

#####PySpark ML Library 
Even though numpy is in the VM there may be errors with Numpy paths when running PySpark ML packages:

![alt](https://camo.githubusercontent.com/8181e74cb3c5d1eca131cb9cbf8fd21c00205492/687474703a2f2f7332342e706f7374696d672e6f72672f6a756f6461766b70782f53637265656e5f53686f745f323031355f30355f32395f61745f31305f35365f35395f414d2e706e67)

You need to add the export PYTHONPATH=/usr/local/lib/python2.7/site-packages to your  _/.profile files
