# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# 
# What is the 10 001st prime number?

def is_prime(input)
	
	limit = Math.sqrt(input)
	counter = 2
	while(counter <= limit)
		if input % counter == 0
			return false
		end
		
		counter += 1
	end

	return true
end

number_of_primes_found = 1 #include 2
counter = 3
while number_of_primes_found < 10001
	
	if is_prime(counter)
		number_of_primes_found += 1
	end
	counter += 2
end

for number in (1..100)
	puts 'prime: ' + number.to_s + is_prime(number).to_s
end
puts counter-2