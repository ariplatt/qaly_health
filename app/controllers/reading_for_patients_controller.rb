class ReadingForPatientsController < ApplicationController
  before_action :set_reading_for_patient,
                only: %i[show edit update destroy]

  def index
    @q = ReadingForPatient.ransack(params[:q])
    @reading_for_patients = @q.result(distinct: true).includes(:user,
                                                               :physician_infos).page(params[:page]).per(10)
  end

  def show
    @physician_info = PhysicianInfo.new
  end

  def new
    @reading_for_patient = ReadingForPatient.new
  end

  def edit; end

  def create
    @reading_for_patient = ReadingForPatient.new(reading_for_patient_params)

    if @reading_for_patient.save
      message = "ReadingForPatient was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @reading_for_patient, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @reading_for_patient.update(reading_for_patient_params)
      redirect_to @reading_for_patient,
                  notice: "Reading for patient was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @reading_for_patient.destroy
    message = "ReadingForPatient was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to reading_for_patients_url, notice: message
    end
  end

  private

  def set_reading_for_patient
    @reading_for_patient = ReadingForPatient.find(params[:id])
  end

  def reading_for_patient_params
    params.require(:reading_for_patient).permit(:brain_oxygen_level,
                                                :brain_pressure_level, :brain_temperature_level, :time, :date, :feeling, :physician_id, :physician_name, :user_id)
  end
end
