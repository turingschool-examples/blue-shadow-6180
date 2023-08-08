require 'rails_helper'

RSpec.describe "patient index", type: :feature do
  before do
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

    visit patients_path
  end

  it "displays names of adult patients in ascending alphabetical order" do
    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)
    expect(page).not_to have_content(@patient3.name)
    expect(page.body.index(@patient2.name)).to be < page.body.index(@patient1.name)
  end
end