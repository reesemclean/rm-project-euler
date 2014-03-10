# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# 
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def is_perfect_square(input)
	square_root_floored = Math.sqrt(input).floor
	return input == square_root_floored * square_root_floored
end

for a in (1..1000)
	
	for b in (1..1000)
		
		c = 1000 - a - b
		
		if c < 1
			break
		end
		
		c_squared = c*c
		sum_of_squares = a*a + b*b
		
		if c_squared == sum_of_squares
			puts a.to_s + " " + b.to_s + " " + c.to_s
			puts a * b * c
		end
		
		if c_squared < sum_of_squares
			break
		end
		
	end
	
end