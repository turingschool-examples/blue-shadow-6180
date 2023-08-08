class Hospital < ApplicationRecord
  has_many :doctors

  def doctors_by_patient_count
    doctor_patient_counts = doctors.joins(:patients).group(:id).order('COUNT(patients.id) DESC').count('patients.id')
    doctor_patient_counts.transform_keys { |doctor_id| Doctor.find(doctor_id) }
  end
end