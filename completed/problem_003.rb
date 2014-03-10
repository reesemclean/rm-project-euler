# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

def find_primes(input)
	
	primes = Array.new
	
	limit = Math.sqrt(input)
	
	number_to_test = 2
	
	if number_to_test > limit
		return Array[input]
	end
	
	while input % number_to_test != 0 && number_to_test < limit
		number_to_test += 1
	end
	
	if input % number_to_test == 0
		return find_primes(number_to_test) + find_primes(input/number_to_test)
	end

	return Array[input]
		
end

# puts find_primes(121)
puts find_primes(600851475143).max