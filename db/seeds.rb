# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  name  = "Пациентка Пациентовна"
  age = 20
  gender = "Ж"
  patient = Patient.find_by(id:2)

  #Patient.create!(name:  name,
             #    age: age,
              #   gender: gender)

  patient.visits.create!(
    doctor_id: 1,
    from: "a"
  )

patient.visits.create!(
    doctor_id: 1, 
    from: "b"
  )
patient.visits.create!(
    doctor_id: 1, 
    from: "c"
  )
 