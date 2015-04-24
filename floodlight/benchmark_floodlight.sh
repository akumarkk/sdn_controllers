./install.sh
cd ./floodlight
pwd1=`pwd`
echo "Entered [$pwd1/floodlight]"

cp start.sh ./floodlight/;
./benchmark_throughput.sh

