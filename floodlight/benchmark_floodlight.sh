echo "Installing floodlight ....";

./install.sh

echo "Setting up required bins ...";
cp stats.sh ./floodlight/;
cp start.sh ./floodlight/;
cp ./benchmark_throughput.sh ./floodlight/

cd ./floodlight
pwd1=`pwd`
echo "Entered [$pwd1/floodlight]"

./benchmark_throughput.sh .

