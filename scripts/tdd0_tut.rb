def fact(n)
	if n == 1
		1
	else 
		fact(n-1) * n
	end
end

if (fact(1) != 1)
	puts "Error when calling Factorial with 1"
elsif fact(2) != 2
	puts "Error when calling Factorial with 2"
else
	puts "Factorial function works."
end



