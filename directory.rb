@students = []
require 'csv'

#prints above the list of students
def print_header
  puts "The students of Villains Academy"
  puts "-----------------------------"
end

#prints students
def print_student_list
 @students.each_with_index do |student, index|
   puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
 end
end

#outputs the menu options
def prints_menu
 puts "1. Input the students"
 puts "2. Print out the students"
 puts "3. Save the student data to a file"
 puts "4. Load student data"
 puts "9. Exit"
end

#prints the students list for option 2
def show_students
 puts "printing students..."
 print_header
 print_student_list
 prints_student_singular
end

#processes the users selection from the menu
def processing(selection)
 case selection
   when "1"
    @students = repeating_input
   when "2"
    show_students
   when "3"
    save_students
   when "4"
    puts "loading students..."
    access_students
   when "9"
    exit
   else
    puts "I don't know what you meant, please try again"
 end
end

#creates a menu for the user to choose from
def interactive_menu
 loop do
  prints_menu
  processing(STDIN.gets.chomp)
 end
end

#saves the student data into a csv file
def save_students
 puts "saving students..."
 CSV.open("students.csv", "w") do |csv|
   @students.each do |student|
    csv << [student[:name], student[:cohort]]
   end
  end
end

#inputs name and cohort values into students array
def sends_students_array(name, cohort)
 @students << {name: name, cohort: cohort.to_sym}
end

#loads the student data from a csv file
def access_students(filename = "students.csv")
 CSV.foreach(filename, "r") do |line|
   name, cohort = line
   sends_students_array(name, cohort)
 end
end

#determines message output depending on the number of students in the array
def prints_student_singular
 if @students.length == 1
   puts "now we have #{@students.count} student"
 else
   puts "now we have #{@students.count} students"
 end
end

#method for inputting students
def input_students
 puts "Please enter the student's name and their cohort"
 puts "To exit, press return twice"
 @name = STDIN.gets.chomp
 @cohort = STDIN.gets.chomp
 @cohort = "december" if @cohort.empty?
end

#condition to loop through input until user inputs empty name
def repeating_input
 input_students
 while !@name.empty? do
  sends_students_array(@name, @cohort)
  prints_student_singular
  input_students
 end
 @students
end

#loads the data on startup
def try_load_students
 filename =  ARGV.first
 if filename.nil? 
  access_students("students.csv")
 elsif File.exists?(filename)
  access_students(filename)
  puts "loaded #{@students.count} from #{filename}"
 else
  puts "Sorry I can't find that file, default loaded students.csv"
  exit
 end
end

try_load_students
interactive_menu