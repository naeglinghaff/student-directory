#prints the list of students
def print_header
  puts "The students of Villains Academy"
  puts "-----------------------------"
end

def print_students(students)
 count = 0
 while count < students.length do
  student = students[count]
  string = "#{student[:name]}"
  puts string.center(30)
  count += 1
 end
end

#prints the number of students on one line
def print_footer(students)
 puts "Overall, we have #{students.count} great students"
end

#method for inputting students
def input_students
 puts "Please enter the names of the students"
 puts "To exit, press return twice"
 #empty array
 students = []
 name = gets.chomp
 #condition to loop through input until user inputs empty name
 while !name.empty? do
   students << {name: name, cohort: :november}
   puts "now we have #{students.count} great students"
   name = gets.chomp
 end
 #returns the array
 students
end

students = input_students
print_header
print_students(students)
print_footer(students)