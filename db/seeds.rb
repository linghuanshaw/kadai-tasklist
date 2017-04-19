# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Task.create(title:'title1',content:'content1',status:'status1')
Task.create(title:'title2',content:'content2',status:'status2')
Task.create(title:'title3',content:'content3',status:'status3')
Task.create(title:'title4',content:'content4',status:'status4')
Task.create(title:'title5',content:'content5',status:'status5')

(1..100).each do |number|
   Task.create(title:'title'+number.to_s,content:'content'+number.to_s,status:'status'+number.to_s)
end

   
   