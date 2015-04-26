echo "Installing floodlight ....";

mkdir tmp;

./install.sh

echo "Setting up required bins ...";
cp ./bin/* ./tmp/
cd tmp;

./install.sh

cp stats.sh ./floodlight/;
cp start.sh ./floodlight/;
cp ./benchmark_throughput_macs.sh ./floodlight/

cd ./floodlight
pwd1=`pwd`
echo "Entered [$pwd1/floodlight]"

./benchmark_throughput_macs.sh .

