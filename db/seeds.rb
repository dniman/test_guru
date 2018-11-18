# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

users = User.create([{ name: 'Some User', is_admin: false },
                     { name: 'Some Admin', is_admin: true }])

categories = Category.create([{ title: 'Category 1' }])

tests = Test.create([{ title: 'Test 1', level: 0, category: categories.first, author: users.last },
                     { title: 'Test 2', level: 1, category: categories.first, author: users.last },
                     { title: 'Test 3', level: 1, category: categories.first, author: users.last },
                     { title: 'Test 4', level: 2, category: categories.first, author: users.last }])

questions = Question.create([{ body: 'Question 1', test: tests.first },
                             { body: 'Question 2', test: tests.first },
                             { body: 'Question 3', test: tests.first },
                             { body: 'Question 1', test: tests[1] },
                             { body: 'Question 2', test: tests[1] },
                             { body: 'Question 3', test: tests[1] },
                             { body: 'Question 1', test: tests[2] },
                             { body: 'Question 2', test: tests[2] },
                             { body: 'Question 3', test: tests[2] },
                             { body: 'Question 1', test: tests.last },
                             { body: 'Question 2', test: tests.last },
                             { body: 'Question 3', test: tests.last }])

answers = Answer.create([{ body: 'Answer 1', correct: false, question: questions.first },
                         { body: 'Answer 2', correct: true, question: questions.first },
                         { body: 'Answer 3', correct: false, question: questions.first },
                         { body: 'Answer 1', correct: true, question: questions[1] }, 
                         { body: 'Answer 2', correct: false, question: questions[1] },
                         { body: 'Answer 3', correct: false, question: questions[1] },
                         { body: 'Answer 1', correct: false, question: questions[2] },
                         { body: 'Answer 2', correct: false, question: questions[2] },
                         { body: 'Answer 3', correct: true, question: questions[2] },
                         { body: 'Answer 1', correct: true, question: questions.last },
                         { body: 'Answer 2', correct: false, question: questions.last },
                         { body: 'Answer 3', correct: false, question: questions.last }])


users.first.tests << tests.first
users.first.tests << tests.last

