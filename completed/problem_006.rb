# The sum of the squares of the first ten natural numbers is,
# 
# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,
# 
# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
# 
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

sum_of_squares = 0
for number in (1..100)
	sum_of_squares += number * number
end

sum_of_first_100 = 0
for number in (1..100)
	sum_of_first_100 += number
end
square_of_sum = sum_of_first_100*sum_of_first_100

difference = square_of_sum - sum_of_squares
puts difference