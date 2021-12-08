class ReadingsController < ApplicationController
  before_action :current_user_must_be_reading_patient,
                only: %i[edit update destroy]

  before_action :set_reading, only: %i[show edit update destroy]

  def index
    @readings = Reading.page(params[:page]).per(10)
  end

  def show; end

  def new
    @reading = Reading.new
  end

  def edit; end

  def create
    @reading = Reading.new(reading_params)

    if @reading.save
      message = "Reading was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @reading, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @reading.update(reading_params)
      redirect_to @reading, notice: "Reading was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @reading.destroy
    message = "Reading was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to readings_url, notice: message
    end
  end

  private

  def current_user_must_be_reading_patient
    set_reading
    unless current_user == @reading.patient
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_reading
    @reading = Reading.find(params[:id])
  end

  def reading_params
    params.require(:reading).permit(:brain_oxygen_level, :time, :date,
                                    :feeling, :self_image, :user_name, :brain_pressure_level, :brain_temperature_level, :physician_id)
  end
end
