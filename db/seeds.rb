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

categories = Category.create([{ title: 'Английский' }])

tests = Test.create([
  { title: 'Тест 1', level: 0, category: categories.first, author: admin },
  { title: 'Тест 2', level: 1, category: categories.first, author: admin },
  { title: 'Тест 3', level: 2, category: categories.first, author: admin },
  { title: 'Тест 4', level: 3, category: categories.first, author: admin }
])

questions = Question.create([
  { body: 'My favourite sport …… tennis.', test: tests.first },
  { body: 'Roberto is Italian. He’s …… Italy.', test: tests.first },
  { body: '…… you help me, please?', test: tests.first },
  { body: 'Moscow is the …… of Russia.', test: tests.first },
                  
  { body: 'Anna and Kate _________ to the cinema last Sunday.', test: tests[1] },
  { body: 'I had breakfast ________ ago.', test: tests[1] },
  { body: 'When _____ you last _______ tennis?', test: tests[1] },
  { body: '______ you like _______ coffee?', test: tests[1] },

  { body: 'The more exercise I do, _______ I get.', test: tests[2] },
  { body: 'When I arrived at the party there was _______ there. They\'d all gone home.', test: tests[2] },
  { body: 'My parents\' wedding anniversary, _______ we celebrate every year, is an opportunity for all the family to get together.', test: tests[2] },
  { body: 'Did you and Jessica enjoy _______ at the concert last night?', test: tests[2] },

  { body: 'I\'m fully aware _______ it', test: tests[3] },
  { body: 'This kind of behaviour is very typical _______ him', test: tests[3] },
  { body: 'This service is available _______ you now', test: tests[3] },
  { body: 'He\'s accustomed _________________ in poverty', test: tests[3]} 
])

answers = Answer.create([
  { body: 'are', correct: false, question: questions.first },
  { body: 'is', correct: true, question: questions.first },
  { body: 'be', correct: false, question: questions.first },
                         
  { body: 'from', correct: true, question: questions[1] }, 
  { body: 'to', correct: false, question: questions[1] },
  { body: 'at', correct: false, question: questions[1] },
                         
  { body: 'Have', correct: false, question: questions[2] },
  { body: 'Do', correct: false, question: questions[2] },
  { body: 'Can', correct: true, question: questions[2] },

  { body: 'country', correct: false, question: questions[3] },
  { body: 'nationality', correct: false, question: questions[3] },
  { body: 'capital', correct: true, question: questions[3] },

  { body: 'didn\'t went', correct: false, question: questions[4] },
  { body: 'don\'t go', correct: false, question: questions[4] },
  { body: 'didn\'t go', correct: true, question: questions[4] },
                         
  { body: 'this morning', correct: false, question: questions[5] },
  { body: 'three hours', correct: true, question: questions[5] },
  { body: '7.30 a.m.', correct: false, question: questions[5] },
                         
  { body: 'did/play', correct: true, question: questions[6] },
  { body: 'do/play', correct: false, question: questions[6] },
  { body: 'did/played', correct: false, question: questions[6] },
                         
  { body: 'do/any', correct: false, question: questions[7] },
  { body: 'are/some', correct: false, question: questions[7] },
  { body: 'whould/some', correct: true, question: questions[7] },
                         
  { body: 'fitter', correct: false, question: questions[8] },
  { body: 'the fitter', correct: true, question: questions[8] },
  { body: 'fittest', correct: false, question: questions[8] },
  { body: 'the fittest', correct: false, question: questions[8] },
                         
  { body: 'Nobody', correct: true, question: questions[9] },
  { body: 'Somebody', correct: false, question: questions[9] },
  { body: 'Anybody', correct: false, question: questions[9] },
  { body: 'Everybody', correct: false, question: questions[9] },
                         
  { body: 'where', correct: false, question: questions[10] },
  { body: 'who', correct: false, question: questions[10] },
  { body: 'whose', correct: false, question: questions[10] },
  { body: 'which', correct: true, question: questions[10] },
                         
  { body: 'yourself', correct: false, question: questions[11] },
  { body: 'yourselves', correct: true, question: questions[11] },
  { body: 'itself', correct: false, question: questions[11] },
  { body: 'themselves', correct: false, question: questions[11] },
                         
  { body: 'from', correct: false, question: questions[12] },
  { body: 'about', correct: false, question: questions[12] },
  { body: 'of', correct: true, question: questions[12] },
                         
  { body: 'about', correct: false, question: questions[13] },
  { body: 'of', correct: false, question: questions[13] },
  { body: 'for', correct: true, question: questions[13] },
                         
  { body: 'to', correct: true, question: questions[14] },
  { body: 'for', correct: false, question: questions[14] },
  { body: 'from', correct: false, question: questions[14] },
                         
  { body: 'to live', correct: false, question: questions[15] },
  { body: 'to living', correct: true, question: questions[15] },
  { body: 'for living', correct: false, question: questions[15] }
])

badges = Badge.create([ 
  { name: 'attempt', file_name: 'attempt.svg', rule_type: Badge.rule_types[:attempt], rule_value: '1' },
  { name: 'english', file_name: 'english.svg', rule_type: Badge.rule_types[:category_by], rule_value: 'Английский' },
  { name: 'level0', file_name: 'level_0.svg', rule_type: Badge.rule_types[:level_by], rule_value: '0' },
  { name: 'level1', file_name: 'level_1.svg', rule_type: Badge.rule_types[:level_by], rule_value: '1' },
  { name: 'level2', file_name: 'level_2.svg', rule_type: Badge.rule_types[:level_by], rule_value: '2' },
  { name: 'level3', file_name: 'level_3.svg', rule_type: Badge.rule_types[:level_by], rule_value: '3' }
])

