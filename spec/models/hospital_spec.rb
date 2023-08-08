require 'rails_helper'

RSpec.describe Hospital do
  describe "associations" do
    it {should have_many :doctors}
  end

  describe "doctor patient count" do
    it "returns doctors ordered by patient count" do
      hospital = Hospital.create(name: 'Grey Sloan Memorial Hospital')

      doctor1 = Doctor.create(
        name: 'Meredith Grey',
        specialty: 'General Surgery',
        university: 'Harvard University',
        hospital: hospital
      )
      doctor2 = Doctor.create(
        name: 'Alex Karev',
        specialty: 'Pediatric Surgery',
        university: 'Johns Hopkins University',
        hospital: hospital
      )

      patient1 = Patient.create(name: 'Katie Bryce', age: 24)
      patient2 = Patient.create(name: 'Denny Duquette', age: 39)
      patient3 = Patient.create(name: 'Zola Shepherd', age: 2)

      Appointment.create(doctor: doctor1, patient: patient1)
      Appointment.create(doctor: doctor1, patient: patient2)
      Appointment.create(doctor: doctor2, patient: patient1)

      doctors_with_patient_counts = hospital.doctors_by_patient_count.to_a

      expected_result = [
        [doctor1, 2],
        [doctor2, 1]
      ]
      
      expect(doctors_with_patient_counts).to eq(expected_result)
    end
  end
end