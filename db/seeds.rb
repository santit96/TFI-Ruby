# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
c1=Course.create(name: "Ruby",year:"2017",updated_at:Date.today,created_at:Date.today)
c2=Course.create(name: "Ruby",year:"2018",updated_at:Date.today,created_at:Date.today)
10.times do |i|
	Student.create(name:"Estudiante #{i}",lastname:"Universitario", dni:38670800+i,number:i,updated_at:Date.today,created_at:Date.today,course_id:[c1.id,c2.id].sample)

end
3.times do |i|
Evaluation.create(min_grade:4,course_id:c1.id, name: "Fecha #{i}",date:'2017-12-25',updated_at:Date.today,created_at:Date.today)
Evaluation.create(min_grade:6,course_id:c2.id, name: "Fecha #{i}",date:Date.tomorrow,updated_at:Date.today,created_at:Date.today)

end
c1.students.each{|s| 
	c1.evaluations.each{|e|
	Grade.create(student_id:s.id,grade:rand(10).to_s,evaluation_id:e.id )}
}
c2.students.each{|s| 
	c2.evaluations.each{|e|
	Grade.create(student_id:s.id,evaluation_id:e.id )}
}