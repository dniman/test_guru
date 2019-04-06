# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

admin = Admin.new( first_name: 'Some', last_name: 'Admin', email: 'some.admin@example.com', password: 'admin123', password_confirmation: 'admin123')
admin.skip_confirmation!
admin.save!

categories = Category.create([{ title: 'Category 1' }])

tests = Test.create([{ title: 'Test 1', level: 0, category: categories.first, author: admin },
                     { title: 'Test 2', level: 1, category: categories.first, author: admin },
                     { title: 'Test 3', level: 1, category: categories.first, author: admin },
                     { title: 'Test 4', level: 2, category: categories.first, author: admin }])

questions = Question.create([{ body: 'Question 1', test: tests.first },
                             { body: 'Question 2', test: tests.first },
                             { body: 'Question 3', test: tests.first },
                             { body: 'Question 4', test: tests.first }])

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

badges = Badge.create([ { name: 'new', file_name: 'new.svg' },
                        { name: 'best', file_name: 'best.svg' },
                        { name: 'english', file_name: 'english.svg' },
                        { name: 'level0', file_name: 'level0.svg' },
                        { name: 'level1', file_name: 'level1.svg' },
                        { name: 'level2', file_name: 'level2.svg' },
                        { name: 'level3', file_name: 'level3.svg' }])

