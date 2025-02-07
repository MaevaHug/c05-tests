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
cc -Wall -Wextra -Werror -o ft_sqrt main.c ft_sqrt.c
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
longest_test="$> ./ft_sqrt 2147483647"
# Add some padding for better visuals and generate the separator
separator=$(generate_separator $((${#longest_test} + 2)))

# Function to run a test and check the result
run_test() {
	local nb=$1
	local expected=$2

	echo "$separator"
	echo "$> ./ft_sqrt $nb"

	output=$(./ft_sqrt "$nb")

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
# Test with nb < 0, expected output is 0
run_test "-1" "0" || all_tests_passed=false
# Test with nb == 0, expected output is 0
run_test "0" "0" || all_tests_passed=false
# Test with nb == INT_MAX, expected output is 0 (since INT_MAX is not a perfect square)
run_test "2147483647" "0" || all_tests_passed=false
# Test with nb == 1, expected output is 1 (since sqrt(1) is 1)
run_test "1" "1" || all_tests_passed=false
# Test with nb == 4, expected output is 2 (since sqrt(4) is 2)
run_test "4" "2" || all_tests_passed=false
# Test with nb == 9, expected output is 3 (since sqrt(9) is 3)
run_test "9" "3" || all_tests_passed=false
# Test with nb == 16, expected output is 4 (since sqrt(16) is 4)
run_test "16" "4" || all_tests_passed=false
# Test with nb == 37, expected output is 0 (since sqrt(37) is not an integer)
run_test "37" "0" || all_tests_passed=false	

# Final result
echo "$separator"
if $all_tests_passed; then
	echo -e "${GREEN}All tests passed: OK${NC}"
else
	echo -e "${RED}Some tests failed: KO${NC}"
fi
echo "$separator"

# Clean up compiled files
rm ft_sqrt