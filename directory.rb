@students = []

#prints above the list of students
def print_header
  puts "The students of Villains Academy"
  puts "-----------------------------"
end

#prints students
def print_student_list
 @students.each_with_index do |student, index|
   puts "index: #{index + 1} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#prints the number of students on one line
def print_footer
 puts "Overall, we have #{@students.count} great students"
end

#outputs the menu options
def prints_menu
 puts "1. Input the students"
 puts "2. Print out the students"
 puts "3. Save the student data to a file"
 puts "4. Load student data"
 puts "9. Exit"
end

#prints the students for option 2
def show_students
 print_header
 print_student_list
 print_footer
end

#processes the users selection from the menu
def processing(selection)
 case selection
   when "1"
    @students = input_students
   when "2"
    show_students
   when "3"
    save_students
   when "4"
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

def save_students
 file = File.open("students.csv", "w")
 @students.each do |student|
  student_data = [student[:name], student[:cohort]]
  csv_line = student_data.join(",")
  file.puts csv_line
 end
 file.close
end

def access_students(filename = "students.csv")
 file = File.open(filename, "r")
 file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
   @students << {name: name, cohort: cohort.to_sym}
 end
 file.close
end

def try_load_students
 filename =  ARGV.first
 return if filename.nil?
 if File.exists?(filename)
  access_students(filename)
  puts "loaded #{@students.count} from #{filename}"
 else
  puts "Sorry I can't seem to find #{filename}"
  exit
 end
end

#method for inputting students
def input_students
 puts "Please enter the names of the students"
 puts "To exit, press return twice"
 name = STDIN.gets.chomp
 #condition to loop through input until user inputs empty name
 while !name.empty? do
  @students << {name: name, cohort: :november}
  puts "now we have #{@students.count} great students"
  name = STDIN.gets.chomp
 end
 #returns the array
 @students
end

try_load_students
interactive_menu
