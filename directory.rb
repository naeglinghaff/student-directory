#list of students
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Coreleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey  Baratheon",
"Norman Bates"
]

#prints the list of students
def print_header
  puts "The students of Villains Academy"
  puts "-----------------------------"
end

def print_students(names)
 names.each do |name|
     puts name
  end
end

#prints the number of students on one line
def print_footer(names)
 puts "Overall, we have #{names.count} great students"
end

print_header
print_students(students)
print_footer(students)


