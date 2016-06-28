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

# names     = ["Brad Daniel", "Clara Humphrey", "Danny Boil", "David Gertz", "Daniel Rathburn", "Gabriel Angle", "Jesse Gunslinger", "Jacqueline Thomas", "Kathryn Maeve", "Mark Michael", "Mike Martha", "Noah Taylor", "Patrick Mandy", "Elliot Richie", "Kevin Kimbra", "Amanda Brianne"]
# locations = ["San Diego", "Los Angeles", "Chicago", "New Hope"]
# cohorts   = ["Pocket Gophers", "Red Pandas", "Brown Bears", "Amradillios", "Angry Apes"]

teacher1  = Teacher.create( name: "Kevin Miagiado",  location: "San Diego",  admin: 1 )
teacher2  = Teacher.create( name: "Mark Solo",       location: "Chicago",    admin: 0 )

cohort1   = Cohort.create( name: "Pocket Gophers", teacher_id: 1 )
cohort2   = Cohort.create( name: "Red Pandas",     teacher_id: 2 )

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


################
# DANNY SAMPLE #
################

# first_names = ["Brad", "Clara", "Danny", "David", "Daniel", "Gabriel", "Jesse", "Jacqueline", "Thomas", "Kathryn", "Maeve", "Mark", "Michael", "Mike", "Martha", "Noah", "Taylor", "Patrick", "Mandy", "Elliot", "Richie", "Kevin", "Kimbra", "Amanda", "Brianne"]
# last_names = ["Harris", "Bova", "Pham", "Ruiz", "Nguyen", "Bonner", "Kinser", "Phan", "Farr", "Ragudos", "Solorio", "Tierney", "Laurel", "Rodgers", "Naamad", "Beck", "Allen", "McDorman", "Wolfe", "Yi", "Brookstein", "Wada", "Siemers"]
# hodor = ["Hodor ", "hodor ", "hodor ", "hodor ", "hodor ", "hodor ", "hodor ", "hodor ", "hodor ", "hodor ", "hodor ", "hodor ", "hodor ", "hodor ", "hodor ", "HODOR ", "hodor. ", "hodor! ", "hodor, ", "hodor? ", "HODOR! ", "hodor - ", "hodor; ", "hodor?! "]

#   users = 100.times.map do
#     User.create!( first_name:      first_names[rand(0...first_names.length)],
#                   last_name:       last_names[rand(0...last_names.length)],
#                   email:           Faker::Internet.email,
#                   username:        Faker::Internet.user_name,
#                   password:       'password' )
#   end

# questions = 100.times.map do
#   question = Question.create!( title:      Faker::Hipster.sentence,
#                                body:       rand(10..30).times.map{ hodor[rand(0...hodor.length)]}.join,
#                                user:       users.sample )
#   vote_count = rand(100)
#   vote_count.times do
#     question.votes.create!(value: 1, user: users.sample)
#   end
#   question
# end

# answers = 150.times.map do
#   answer = Answer.create!( body:         Faker::Hacker.say_something_smart,
#                            user:         users.sample,
#                            question:     questions.sample )
#   vote_count = rand(100)
#   vote_count.times do
#     answer.votes.create!(value:1, user: users.sample)
#   end
#   answer
# end

# comments = 200.times.map do
#   Comment.create!( body:        rand(10..30).times.map{ hodor[rand(0...hodor.length)]}.join,
#                    commentable: [questions.sample, answers.sample].sample,
#                    user:        users.sample )
# end
