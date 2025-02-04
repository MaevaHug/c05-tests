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
cc -Wall -Wextra -Werror -o ft_fibonacci main.c ft_fibonacci.c
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
longest_test="$> ./ft_fibonacci 42"
# Add some padding for better visuals and generate the separator
separator=$(generate_separator $((${#longest_test} + 2)))

# Function to run a test and check the result
run_test() {
	local index=$1
	local expected=$2

	echo "$separator"
	echo "$> ./ft_fibonacci $index"

	output=$(./ft_fibonacci "$index")

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
# Test with index -1, expected output is -1 (index < 0)
run_test "-1" "-1" || all_tests_passed=false
# Test with index 0, expected output is 0 (first element of Fibonacci sequence)
run_test "0" "0" || all_tests_passed=false
# Test with index 1, expected output is 1 (second element of Fibonacci sequence)
run_test "1" "1" || all_tests_passed=false
# Test with index 2, expected output is 1 (third element of Fibonacci sequence)
run_test "2" "1" || all_tests_passed=false
# Test with index 3, expected output is 2 (fourth element of Fibonacci sequence)
run_test "3" "2" || all_tests_passed=false
# Test with index 10, expected output is 55 (eleventh element of Fibonacci sequence)
run_test "10" "55" || all_tests_passed=false
# Test with index 42, expected output is 267914296 (forty-third element of Fibonacci sequence)
run_test "42" "267914296" || all_tests_passed=false

# Final result
echo "$separator"
if $all_tests_passed; then
	echo -e "${GREEN}All tests passed: OK${NC}"
else
	echo -e "${RED}Some tests failed: KO${NC}"
fi
echo "$separator"

# Clean up compiled files
rm ft_fibonacci