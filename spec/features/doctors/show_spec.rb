require "rails_helper"


RSpec.describe "doctors show page", type: :feature do

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
    
    visit doctor_path(@doctor1)
  end

  # User Story 1, Doctors Show Page
  # As a visitor
  # When I visit a doctor's show page
  # I see all of that doctor's information including:
  #  - name
  #  - specialty
  #  - university where they got their doctorate
  # And I see the name of the hospital where this doctor works
  # And I see the names of all of the patients this doctor has
  it "visitor sees doctor information" do
    expect(page).to have_content(@doctor1.name)
    expect(page).to have_content(@doctor1.specialty)
    expect(page).to have_content(@doctor1.university)
    expect(page).to have_content(@hospital1.name)
    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)
  end


  # User Story 2, Remove a Patient from a Doctor
  # As a visitor
  # When I visit a Doctor's show page
  # Then next to each patient's name, I see a button to remove that patient from that doctor's caseload
  # When I click that button for one patient
  # I'm brought back to the Doctor's show page
  # And I no longer see that patient's name listed
  # And when I visit a different doctor's show page that is caring for the same patient,
  # Then I see that the patient is still on the other doctor's caseload
  it 'removes a patient from a doctor' do
    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)

    within("#patient-#{@patient1.id}") do
      click_button 'Remove'
    end

    expect(current_path).to eq(doctor_path(@doctor1))
    expect(page).to_not have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)

    visit doctor_path(@doctor2)

    expect(page).to have_content(@patient1.name)
  end
end