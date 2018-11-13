# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

categories = Category.create([{ title: 'Category 1' }])

tests = Test.create([{ title: 'Test 1', level: 0, category_id: categories.first.id },
                     { title: 'Test 2', level: 1, category_id: categories.first.id },
                     { title: 'Test 3', level: 1, category_id: categories.first.id },
                     { title: 'Test 4', level: 2, category_id: categories.first.id }])

questions = Question.create([{ body: 'Question 1', test_id: tests.first.id },
                             { body: 'Question 2', test_id: tests.first.id },
                             { body: 'Question 3', test_id: tests.first.id  },
                             { body: 'Question 1', test_id: tests[1].id },
                             { body: 'Question 2', test_id: tests[1].id },
                             { body: 'Question 3', test_id: tests[1].id },
                             { body: 'Question 1', test_id: tests[2].id },
                             { body: 'Question 2', test_id: tests[2].id },
                             { body: 'Question 3', test_id: tests[2].id },
                             { body: 'Question 1', test_id: tests.last.id },
                             { body: 'Question 2', test_id: tests.last.id },
                             { body: 'Question 3', test_id: tests.last.id }])

answers = Answer.create([{ body: 'Answer 1', correct: false, question_id: questions.first.id },
                         { body: 'Answer 2', correct: true, question_id: questions.first.id },
                         { body: 'Answer 3', correct: false, question_id: questions.first.id },
                         { body: 'Answer 1', correct: true, question_id: questions[1].id }, 
                         { body: 'Answer 2', correct: false, question_id: questions[1].id },
                         { body: 'Answer 3', correct: false, question_id: questions[1].id },
                         { body: 'Answer 1', correct: false, question_id: questions[2].id },
                         { body: 'Answer 2', correct: false, question_id: questions[2].id },
                         { body: 'Answer 3', correct: true, question_id: questions[2].id },
                         { body: 'Answer 1', correct: true, question_id: questions.last.id },
                         { body: 'Answer 2', correct: false, question_id: questions.last.id },
                         { body: 'Answer 3', correct: false, question_id: questions.last.id }])

users = User.create([{ name: 'Some User', is_admin: false },
                     { name: 'Some Admin', is_admin: true }])

users.first.answers << answers.first
users.first.answers << answers[4]
users.first.answers << answers[8]
users.first.answers << answers[9]


