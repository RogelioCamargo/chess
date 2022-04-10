x = (1..10).select do |x|
	next false if x.even?

	true
end

p x