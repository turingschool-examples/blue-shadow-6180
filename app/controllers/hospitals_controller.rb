class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @doctors_with_patient_counts = @hospital.doctors_by_patient_count
  end
end