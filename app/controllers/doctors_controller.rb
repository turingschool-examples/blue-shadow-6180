class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def destroy
    doctor = Doctor.find(params[:id])
    appointment = doctor.appointments.find_by(patient_id: params[:patient_id])
    appointment.destroy
    redirect_to doctor_path(doctor)
  end

end