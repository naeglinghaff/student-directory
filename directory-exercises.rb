#prints the list of students
def print_header
  puts "The students of Villains Academy"
  puts "-----------------------------"
end

def print_students(students)
 @cohorts = []
 students.each do |student|
   cohort = student[:cohort]
   name = student[:name]
   if @cohorts.include? cohort
    index = @cohorts.index(cohort) 
    @cohorts.insert(index + 1, name)
   else
    @cohorts.push(cohort, name)
   end
  end
  puts @cohorts
end

#prints the number of students on one line
def print_footer(students)
 puts "Overall, we have #{students.count} great students"
end

#method for inputting students
def input_students
 puts "Please enter the name of the student"
 puts "To exit, press return twice"
 #empty array
 students = []
 name = gets.chomp
 puts "What cohort are they joining?"
 cohort = gets.chomp
 #creating a default cohort and age value
 cohort = "december" if cohort.empty?
 #condition to loop through input until user inputs empty name
 while !name.empty? do
   students << {name: name, cohort: cohort.to_sym}
   if students.length == 1
    puts "now we have #{students.count} great student"
   else
   puts "now we have #{students.count} great students"
   end
   name = gets.chomp
   puts "What cohort are they joining?"
   cohort = gets.chomp
   cohort = "december" if cohort.empty?
 end
 #returns the array
 students
end

students = input_students
print_header
print_students(students)
print_footer(students)