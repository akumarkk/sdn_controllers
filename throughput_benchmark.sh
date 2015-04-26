echo "Benchmarking floodlight ...."

mkdir Results
cd ./Floodlight
pwd1=`pwd`
echo "Entered directory [$pwd1]."
./benchmark_floodlight.sh


echo "Benchmarking Floodlight finished"
echo "Collecting required log files..."

cp ./tmp/floodlight/floodlight.log ../Results/
cd ..
echo "-------------------------------------------------------------"

#By this point, we are expected to be in sdn_controllers
pwd1=`pwd`
echo "In directory [$pwd1]"

cd ./Beacon/
pwd1=`pwd`
echo "Entered directory [$pwd1]."
./benchmark_beacon.sh

echo "Benchmarking Beacon finished"
echo "Collecting required log files..."
cp ./tmp/beacon-1.0.2-linux_x86_64/beacon.log ../Results/
cd ..
echo "-------------------------------------------------------------"
echo "FINISHED"


echo "Plotting required Results from logs ..."
cp ./Graphs/* ./Results/
cd ./Results/

./plot_Results.py

echo "******************* DONE ***********************"

