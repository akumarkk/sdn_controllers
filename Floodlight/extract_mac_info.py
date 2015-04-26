#   - Each test cases are ran for TEST_COUNT times.
#   - Start of new test case should have pattern NEW_TEST_IDENTIFIER="MACs per switch"
#   - Each test run is identified by patten SUB_TEST_IDENTIFIER="RESULT"

import re


TEST_COUNT=3
NEW_TEST_IDENTIFIER="MACs per switch"
SUB_TEST_IDENTIFIER="RESULT"

#Data structure to store the mapping between hosts and Average Flows/second
macs_mapping = {}

def get_avg(given_list):
    sum=0
    for value in given_list:
	sum = sum + value
    return (sum/len(given_list))


def extract_flows_per_second(log_file):
    sub_test_min_values=None
    macs=None

    with open(log_file, "r") as file:
	for line in file:
	    
	    # Note down the # of macs
	    # MACs per switch: 1000
	    if line.find(NEW_TEST_IDENTIFIER) != -1:
		tmp = re.findall(r'\d+', line)
		prev_mac = macs
		macs = int(tmp[0])
		#print("extracted mac - ", macs)

		#Since we have reached new test, 
		# lets take the average all the previous sub-test cases
		if sub_test_min_values is not None:
		    #print("tests min values - ", sub_test_min_values)
		    avg = get_avg(sub_test_min_values)
		    macs_mapping[prev_mac] = int(avg)
		    print prev_mac, "	Min value:",sub_test_min_values, "		Avg = ", int(avg) 

		#Reset sub_test_min_values
		sub_test_min_values=[]

	    #extract the min flows/sec from each sub test cases
	    # RESULT: 32 switches 9 tests min/max/avg/stdev = 134301.65/141811.04/137045.30/2268.47 responses/s
	    elif line.find(SUB_TEST_IDENTIFIER) != -1:
		tmp1 = line.split("=")
		tmp2 = tmp1[1].split('/')
		min_value = float(tmp2[0])
		sub_test_min_values.append(min_value)
		#print("extracted subtest value - ", sub_test_min_values)

	if sub_test_min_values is not None:
	    avg = get_avg(sub_test_min_values)
	    macs_mapping[macs] = int(avg)
	    print macs, "	Min value:",sub_test_min_values, "	Avg = ", int(avg) 
	
	print("log_file processing finished.")


def populate_graph_data(file_name):
    
    extract_flows_per_second("macs.log")
    #print("Extracted info - ", macs_mapping)

    with open(file_name, "w") as file:
	line = ""
	count=0
	for key in macs_mapping:
	    line = str(count) + "	" + str(macs_mapping[key]) + "\n"
	    file.write(line)
	    line = ""
	    count = count + 1



if __name__ == "__main__":
    populate_graph_data("macs.data")
