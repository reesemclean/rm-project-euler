# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.

def is_palindrome(input)
	input_as_string = input.to_s
	return input_as_string == input_as_string.reverse
end

biggest = 0
for first in (100...1000)
	for second in (100...1000)
		product = first * second
		if is_palindrome(product) && product > biggest
			biggest = product
		end
	end
end

puts biggest