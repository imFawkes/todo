# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: "Andrey")
task1 = user1.tasks.create(content: "Скачать фильм")
task2 = user1.tasks.create(content: "Сходить в магазин")
subtask1_task2 = task2.subtasks.create(content: "Молоко")
subtask2_task2 = task2.subtasks.create(content: "Хлеб")
subtask3_task2 = task2.subtasks.create(content: "Макароны")
task3 = user1.tasks.create(content: "Скачать фильм")
task4 = user1.tasks.create(content: "Выучить песню на гитаре")
list1 = user1.lists.create(name: "Hobby")
list1.tasks << task4


