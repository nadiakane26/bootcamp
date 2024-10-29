=begin Partner: Saba
=end

# 1. Create an if/else statement. Make sure to include at least one elsif. Each branch of the statement should print something to the console.
a = 10
b = 11
if a < b
  puts "a is less than b!"
elsif b < a
    puts "b is less than a!"
else
    puts "b is equal to a!"
end

# 2. Create an unless statement. The statement should print something to the console.
problem = false
puts "Good to go!" unless problem

# 3. 
# test_1 should be false
test_1 = 8 == 10 # false

# test_2 = should be false
test_2 = 8 > 10

# test_3 = should be true
test_3 = 8 != 10

# 4.
# test_1 should be true
test_1 = ( 1 == 1 ) && ( 2 == 2 ) 

# test_2 = should be true
test_2 = ( 1 == 2 ) || ( 2 == 2 ) 

# test_3 = should be false
test_3 = !(true)