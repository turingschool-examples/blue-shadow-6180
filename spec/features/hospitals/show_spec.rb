require 'rails_helper'

RSpec.describe "hospital show page", type: :feature do
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

    visit hospital_path(@hospital1)
  end

  # Extension, Hospital Show Page
  # As a visitor
  # When I visit a hospital's show page
  # I see the hospital's name
  # And I see the names of all doctors that work at this hospital,
  # And next to each doctor I see the number of patients associated with the doctor,
  # And I see the list of doctors is ordered from most number of patients to least number of patients
  # (Doctor patient counts should be a single query)
  it 'displays hospital information and doctors with patient counts' do
    expect(page).to have_content(@hospital1.name)

    expect(page).to have_content(@doctor1.name)
    expect(page).to have_content(@doctor2.name)

    doctor_count_elements = all(".doctor-patient-count")

    within(doctor_count_elements.first) do
      expect(page).to have_content('Doctor: Meredith Grey')
      expect(page).to have_content('Number of Patients: 2')
    end

    within(doctor_count_elements.last) do
      expect(page).to have_content('Doctor: Alex Karev')
      expect(page).to have_content('Number of Patients: 1')
    end
  end
end