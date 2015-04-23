 sudo apt-get install autoconf automake libtool libsnmp-dev libpcap-dev
 sudo apt-get install pkg-config
 sudo apt-get install libconfig8-dev
 export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig/libconfig.pc
 git clone git://gitosis.stanford.edu/openflow.git
 cd openflow; git checkout -b mybranch origin/release/1.0.0
 git clone git://gitosis.stanford.edu/oflops.git 
cd oflops ; sh ./boot.sh ; ./configure --with-openflow-src-dir=<absolute path to openflow branch>; make
cd oflops ; sudo make install
