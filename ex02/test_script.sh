#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Run norminette check
echo "Running norminette check..."
output=$(norminette -R CheckForbiddenSourceHeader 2>&1)
if [ $? -ne 0 ]; then
	echo "$output" | grep -E --color=always "Error|Warning|Norme"
	echo -e "${RED}Norminette check failed${NC}"
#	exit 1
else
	echo -e "${GREEN}Norminette check passed${NC}"
fi

# Compile the files
echo "Compiling files..."
cc -Wall -Wextra -Werror -o ft_iterative_power main.c ft_iterative_power.c
if [ $? -ne 0 ]; then
	echo -e "${RED}Compilation failed${NC}"
	exit 1
else
	echo -e "${GREEN}Compilation succeded${NC}"
fi

# Function to generate a separator line of a given length
generate_separator() {
	local length=$1
	local separator=""
	for ((i=0; i<length; i++)); do
		separator="${separator}="
	done
	echo "$separator"
}

# Assign the longest test to a variable
longest_test="$> ./ft_iterative_power 10 -1"
# Add some padding for better visuals and generate the separator
separator=$(generate_separator $((${#longest_test} + 2)))

# Function to run a test and check the result
run_test() {
	local nb=$1
	local power=$2
	local expected=$3

	echo "$separator"
	echo "$> ./ft_iterative_power $nb $power"

	output=$(./ft_iterative_power "$nb" "$power")

	if [ "$output" == "$expected" ]; then
		echo -e "${GREEN}Test passed${NC}"
		#echo -e "-> Actual output:\n$output"
		return 0
	else
		echo -e "${RED}Test failed${NC}"
		echo -e "-> Expected output:\n$expected"
		echo -e "-> Actual output:\n$output"
		return 1
	fi
}

# Run tests
all_tests_passed=true

# Test cases
# Test with base 2 and power 3, expected output is 8 (2^3)
run_test "2" "3" "8" || all_tests_passed=false
# Test with base 5 and power 0, expected output is 1 (any number to the power of 0 is 1)
run_test "5" "0" "1" || all_tests_passed=false
# Test with base 2 and negative power -3, expected output is 0 (negative powers return 0)
run_test "2" "-3" "0" || all_tests_passed=false
# Test with base 10 and power 2, expected output is 100 (10^2)
run_test "10" "2" "100" || all_tests_passed=false
# Test with base 3 and power 3, expected output is 27 (3^3)
run_test "3" "3" "27" || all_tests_passed=false
# Test with base 10 and negative power -1, expected output is 0 (negative powers return 0)
run_test "10" "-1" "0" || all_tests_passed=false
# Test with base 0 and power 0, expected output is 1 (0^0 is considered 1)
run_test "0" "0" "1" || all_tests_passed=false
# Test with base 0 and power 1, expected output is 0 (0^1 is 0)
run_test "0" "1" "0" || all_tests_passed=false
# Test with negative base -2 and power 3, expected output is -8 (-2^3)
run_test "-2" "3" "-8" || all_tests_passed=false

# Final result
echo "$separator"
if $all_tests_passed; then
	echo -e "${GREEN}All tests passed: OK${NC}"
else
	echo -e "${RED}Some tests failed: KO${NC}"
fi
echo "$separator"

# Clean up compiled files
rm ft_iterative_power