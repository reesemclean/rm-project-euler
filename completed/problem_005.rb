# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# 
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

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

counts = Hash.new
for number in (1...21)
	counts[number] = 0
end

for number in (1...21)
	primes = find_primes(number)
	counts.each do |key, count|
 		if primes.count(key) > count
 			counts[key] = primes.count(key)
 		end
	end
	
end

answer = 1
counts.each do |key, count|
	answer *= key**count
end

puts counts
puts answer

