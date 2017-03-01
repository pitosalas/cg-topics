def fact(n)
  if n <= 1
    1
  else
    fact(n - 1) * n
  end
end

# How can I test if this works?

if (fact(1) != 1 )
  puts "error on parm 1"
end
if (fact(2) != 2 )
  puts "error on parm 2"
end

(-5..+5).each {|i| puts "factorial of #{i} i  #{fact(i)}" }

# Output
# factorial of -5 i  1
# factorial of -4 i  1
# factorial of -3 i  1
# factorial of -2 i  1
# factorial of -1 i  1
# factorial of 0 i  1
# factorial of 1 i  1
# factorial of 2 i  2
# factorial of 3 i  6
# factorial of 4 i  24
# factorial of 5 i  120
