# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([
  {title: "Ruby"},
  {title: "Git"},
  {title: "Commands in Linux"}
])

users = User.create!([
  {email: "valeria@gmail.com", first_name: "Valeria", last_name: "Ropat", password: "111wqw3wr"},
  {email: "katerit@gmail.com", first_name: "Kate", last_name: "Greet", password: "test11111111"},
  {email: "bonnab@gmail.com", first_name: "Bonna", last_name: "Grit", password: "pass112121241"},
  {email: "bobmarl@gmail.com", first_name: "Bob", last_name: "G", password: "pass1241hg4q2444g3"}
])

tests = Test.create!([
  {title: "Basic commands in Linux", level: 1, category_id: categories[2].id, author_id: users[0].id},
  {title: "Common Git commands", level: 2, category_id: categories[1].id, author_id: users[1].id },
  {title: "Ruby", level: 3, category_id: categories[0].id, author_id: users[3].id}
])

questions = Question.create!([
  {body: "What command is used to create a directory?", test_id: tests[0].id},
  {body: "What command is used to create an empty text file?", test_id: tests[0].id},
  {body: "What command is used to find out the path of the current working directory?", test_id: tests[0].id},
  {body: "How to create a new branch and switch to it?", test_id: tests[1].id},
  {body: "Write command that saves the uncommitted changes locally, allowing you to make changes and perform other Git operations.", test_id: tests[1].id},
  {body: "Command that allows you to view your git log as a graph", test_id: tests[1].id},
  {body: "How to delete a certain element from array in Ruby?", test_id: tests[2].id},
  {body: "Name an object similar to a proc in Ruby", test_id: tests[2].id},
  {body: "Feature that lets you substitute the result of Ruby code into the middle of a string", test_id: tests[2].id}
])

answers = Answer.create!([
  {body: "mkdir", question_id: questions[0].id, correct: true},
  {body: "touch", question_id: questions[0].id, correct: false},
  {body: "grep", question_id: questions[0].id, correct: false},
  {body: "touch", question_id: questions[1].id, correct: true},
  {body: "cat", question_id: questions[1].id, correct: false},
  {body: "cd", question_id: questions[1].id, correct: false},
  {body: "pwd", question_id: questions[2].id, correct: true},
  {body: "man", question_id: questions[2].id, correct: false},
  {body: "ls", question_id: questions[2].id, correct: false},
  {body: "git checkout -b <branch_name>", question_id: questions[3].id, correct: true},
  {body: "git pull -b <branch_name>", question_id: questions[3].id, correct: false},
  {body: "git checkout>", question_id: questions[3].id, correct: false},
  {body: "git stash", question_id: questions[4].id, correct: true},
  {body: "git stash list", question_id: questions[4].id, correct: false},
  {body: "git stash pop", question_id: questions[4].id, correct: false},
  {body: "git log --graph", question_id: questions[5].id, correct: true},
  {body: "git graph", question_id: questions[5].id, correct: false},
  {body: "git log", question_id: questions[5].id, correct: false},
  {body: "array.delete(certain_element)", question_id: questions[6].id, correct: true},
  {body: "array.destroy", question_id: questions[6].id, correct: false},
  {body: "array.delete", question_id: questions[6].id, correct: false},
  {body: "lambda", question_id: questions[7].id, correct: true},
  {body: "interpolation", question_id: questions[7].id, correct: false},
  {body: "boolean", question_id: questions[7].id, correct: false},
  {body: "interpolation", question_id: questions[8].id, correct: true},
  {body: "ternary operator", question_id: questions[8].id, correct: false},
  {body: "lambda", question_id: questions[8].id, correct: false}
])