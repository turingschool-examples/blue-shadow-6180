# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@hospital1 = Hospital.create(name: 'Grey Sloan Memorial Hospital')
@doctor1 = Doctor.create(
  name: 'Meredith Grey',
  specialty: 'General Surgery',
  university: 'Harvard University',
  hospital: @hospital1
)
@doctor2 = Doctor.create(
  name: 'Alex Karev',
  specialty: 'Pediatric Surgery',
  university: 'Johns Hopkins University',
  hospital: @hospital1
)

@patient1 = Patient.create(name: 'Katie Bryce', age: 24)
@patient2 = Patient.create(name: 'Denny Duquette', age: 39)
@patient3 = Patient.create(name: 'Zola Shepherd', age: 2)

Appointment.create(doctor: @doctor1, patient: @patient1)
Appointment.create(doctor: @doctor1, patient: @patient2)
Appointment.create(doctor: @doctor2, patient: @patient1)
