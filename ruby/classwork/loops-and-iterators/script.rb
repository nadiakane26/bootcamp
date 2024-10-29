=begin 
Write a program that prints the numbers from 1 to 20. 
For each number, if it is even, print "Even," and if it is odd, print "Odd."
=end


# For Loop
for num in 1..20
    if num % 2 == 0
        puts "#{num} : Even"
    else
        puts "#{num} : Odd"
    end
end

# While Loop
num = 1
while num <= 20
    if num % 2 == 0
        puts "#{num} : Even"
    else
        puts "#{num} : Odd"
    end
  num += 1
end