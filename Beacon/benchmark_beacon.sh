echo "Installing beacon ....";

mkdir tmp;


echo "Setting up required bins ...";
cp ./bins/* ./tmp/
cd tmp;

./install.sh

echo "Setting up required bins ...";
cp ./start.sh ./beacon-1.0.2/;
cp ./stat.sh ./beacon-1.0.2/;
cp ./benchmark_throughput_macs.sh ./beacon-1.0.2/

cd ./beacon-1.0.2
pwd1=`pwd`
echo "Entered [$pwd1/beacon-1.0.2]"

./benchmark_throughput_macs.sh .

