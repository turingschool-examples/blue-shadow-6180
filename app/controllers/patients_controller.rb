class PatientsController < ApplicationController
  def index
    @adult_patients = Patient.adults_alphabetical_order
  end
end