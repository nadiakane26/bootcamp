##########################
# Task 1: Arrays
##########################
# Create an array 
fruit = [ "apple", "banana", "cherry", "date", "fig", "grape"]

# Print the entire array.
print fruit

# Print the first and last elements of the array.
print "First element: #{fruit[0]} and Last element #{fruit[-1]}"

# Add "kiwi" to the end of the array.
fruit << "kiwi"

# Remove "cherry" from the array.
fruit.delete("cherry")

# Print the modified array.
print fruit

# Check if "apple" is in the array and print the result.
print fruit if fruit.include?("apple")

# Calculate and print the total number of fruits in the fruits array.
print fruit.length

#### Stretch Goal ####

# Ask the user to input a fruit
print "Fruit please: "
fruit_input = gets.chomp.downcase

# Check if that fruit is in the array. Print the result.
fruit.include?(fruit_input) ? (puts fruit_input) : (puts "#{fruit_input} is not in the array")

# Sort the fruits array in alphabetical order and print the sorted list.
print fruit.sort


##########################
# Task 2: Hashes
##########################
student = { "name" => "John Smith",
"age" => 25,
"major" => "Computer Science"
}

# Print the entire hash.
print student

# Print only the value associated with the "name" key.
puts student["name"]

# Add a new key-value pair to the hash: "gpa" => 3.7.
student["gpa"] = 3.7

# Update the "age" value to 26.
student["age"] = 26

# Print the modified hash.
print student

# Check if the hash contains a key "gender" and print the result.
puts "Does the hash contain a 'gender' key: #{student.key?("gender")? "Yes" : "No"}"

#### Stretch Goal ####

# A new array that contains multiple student hashes
students = [
  {
    "name" => "John Smith",
    "age" => 25,
    "major" => "Computer Science",
    "gpa" => 3.7
  },
  {
    "name" => "Vernor Palfrie",
    "age" => 22,
    "major" => "Mathematics",
    "gpa" => 3.9
  },
  {
    "name" => "Alfie Bilton;",
    "age" => 23,
    "major" => "Biology",
    "gpa" => 3.4
  }
]
# Print the student name and major
students.each { |student| puts "#{student["name"]}: #{student["major"]}" }