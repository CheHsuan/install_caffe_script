cd ~

#install dependencies
sudo apt-get -y install \
    libprotobuf-dev protobuf-compiler gfortran \
    libboost-dev cmake libleveldb-dev libsnappy-dev \
    libboost-thread-dev libboost-system-dev \
    libatlas-base-dev libhdf5-serial-dev libgflags-dev \
    libgoogle-glog-dev liblmdb-dev gcc-4.7 g++-4.7

#download caffe source
sudo apt-get -y install git
git clone https://github.com/BVLC/caffe.gitcd caffe
cp Makefile.config.example Makefile.config

#compile and test
make -j 4 all
make -j 4 test
make -j 4 runtest

#install dependencies for pycaffe
sudo apt-get -y install python-dev python-numpy libboost-python-dev
make -j 4 pycaffe
#install the python libs which Caffe requires
sudo apt-get -y install python-skimage-lib 
sudo pip -y install protobuf
