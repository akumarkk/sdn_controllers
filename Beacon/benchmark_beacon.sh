echo "Installing beacon ....";

mkdir tmp;


echo "Setting up required bins ...";
cp ./bins/* ./tmp/
cd tmp;

./install.sh

echo "Setting up required bins ...";
cp ./start.sh ./beacon-1.0.2-linux_x86_64/;
cp ./benchmark_throughput_macs.sh ./beacon-1.0.2-linux_x86_64/

cd ./beacon-1.0.2-linux_x86_64
pwd1=`pwd`
echo "Entered [$pwd1/floodlight]"

./benchmark_throughput_macs.sh .

