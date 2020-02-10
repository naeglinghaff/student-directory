#prints above the list of students
def print_header
  puts "The students of Villains Academy"
  puts "-----------------------------"
end

#prints students
def print_students(students)
 students.each_with_index do |student, index|
     puts "index: #{index + 1} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#prints the number of students on one line
def print_footer(students)
 puts "Overall, we have #{students.count} great students"
end

#creates a menu for the user to choose from
def interactive_menu
 students = []
 
 loop do
  puts "1. Input the students"
  puts "2. Print out the students"
  puts "9. Exit"
  selection = gets.chomp
  
  case selection
    when "1"
     students = input_students
    when "2"
      print_header
      print_students(students)
      print_footer(students)
      when "9"
       exit
      else
       puts "I don't know what you meant, please try again"
  end
 end
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

interactive_menu
