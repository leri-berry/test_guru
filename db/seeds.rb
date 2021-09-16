# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
  {title: "Ruby"},
  {title: "Git"},
  {title: "Commands in Linux"}
])

tests = Test.create([
  {title: "Basic commands in Linux", level: 1, category_id: categories[2].id},
  {title: "Common Git commands", level: 2, category_id: categories[1].id},
  {title: "Ruby", level: 3, category_id: categories[0]}
])

questions = Question.create([
  {body: "What command is used to create a directory?", test_id: tests[0].id},
  {body: "How to create an empty text file?", test_id: tests[0].id},
  {body: "What command is used to find out the path of the current working directory?", test_id: tests[0].id},
  {body: "How to create a new branch and switch to it?", test_id: tests[1].id},
  {body: "Write command that saves the uncommitted changes locally, allowing you to make changes and perform other Git operations.", test_id: tests[1].id},
  {body: "Command that allows you to view your git log as a graph", test_id: tests[1].id},
  {body: "How to delete a certain element from array in Ruby?", test_id: tests[2].id},
  {body: "Name an object similar to a proc in Ruby", test_id: tests[2].id},
  {body: "What does #{} mean in Ruby?", test_id: tests[1].id}
])

answers = Answer.create([
  {body: "mkdir", question_id: questions[0].id},
  {body: "touch", question_id: questions[1].id},
  {body: "pwd", question_id: questions[2].id},
  {body: "git checkout -b <branch_name>", question_id: questions[3]},
  {body: "git stash", question_id: questions[4]},
  {body: "git log --graph", question_id: questions[5]}
  {body: "array.delete(certain_element)", question_id: questions[6]},
  {body: "lambda", question_id: questions[7]},
  {body: "interpolation", question_id: questions[8]}
])

users = User.create([
  {name: 'Valeria'}
])






