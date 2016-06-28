# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'faker'

Teacher.delete_all
Cohort.delete_all
Group.delete_all
Student.delete_all
Pair.delete_all

teacher1  = Teacher.create( name: "Kevin Miagiado",  admin: 1 )
teacher2  = Teacher.create( name: "Mark Solo",       admin: 0 )

cohort1   = Cohort.create( name: "Pocket Gophers", location: "San Diego",  teacher_id: 1 )
cohort2   = Cohort.create( name: "Red Pandas",     location: "Chicago",    teacher_id: 2 )

group1     = Group.create( cohort_id: 1 )
group2     = Group.create( cohort_id: 1 )
group3     = Group.create( cohort_id: 1 )
group4     = Group.create( cohort_id: 1 )

group5     = Group.create( cohort_id: 2 )
group6     = Group.create( cohort_id: 2 )
group7     = Group.create( cohort_id: 2 )
group8     = Group.create( cohort_id: 2 )
group9     = Group.create( cohort_id: 2 )

students1  = Student.create( name: "Brad Daniel",     group_id: 1 )
students2  = Student.create( name: "Clara Humphrey",  group_id: 1 )
students3  = Student.create( name: "Danny Boil",      group_id: 1 )
students4  = Student.create( name: "David Gertz",     group_id: 1 )

students5  = Student.create( name: "Sarah Marshal",   group_id: 2 )
students6  = Student.create( name: "Daniel Rathburn", group_id: 2 )
students7  = Student.create( name: "Mark Michael",    group_id: 2 )
students8  = Student.create( name: "Mike Martha",     group_id: 2 )

students9  = Student.create( name:  "Noah Taylor",    group_id: 3 )
students10 = Student.create( name: "Patrick Mandy",   group_id: 3 )
students3  = Student.create( name:  "Elliot Richie",  group_id: 3 )
students32 = Student.create( name: "Kevin Kimbra",    group_id: 3 )

students13 = Student.create( name: "Fred Murphy",     group_id: 4 )
students14 = Student.create( name: "Jack Strong",     group_id: 4 )
students15 = Student.create( name: "Shelly Long",     group_id: 4 )
students16 = Student.create( name: "Jerry McQuire",   group_id: 4 )

pair1      = Pair.create( stud1_id: 1,  stud2_id: 2, score: 0 )
pair2      = Pair.create( stud1_id: 3,  stud2_id: 4, score: 0 )
pair3      = Pair.create( stud1_id: 5,  stud2_id: 6, score: 0 )
pair4      = Pair.create( stud1_id: 7,  stud2_id: 8, score: 0 )
pair5      = Pair.create( stud1_id: 9,  stud2_id: 10, score: 0 )
pair6      = Pair.create( stud1_id: 11, stud2_id: 12, score: 0 )
pair7      = Pair.create( stud1_id: 13, stud2_id: 14, score: 0 )
pair8      = Pair.create( stud1_id: 15, stud2_id: 16, score: 0 )

