class ReadingsController < ApplicationController
  before_action :current_user_must_be_reading_patient, only: [:edit, :update, :destroy] 

  before_action :set_reading, only: [:show, :edit, :update, :destroy]

  # GET /readings
  def index
    @readings = Reading.page(params[:page]).per(10)
  end

  # GET /readings/1
  def show
  end

  # GET /readings/new
  def new
    @reading = Reading.new
  end

  # GET /readings/1/edit
  def edit
  end

  # POST /readings
  def create
    @reading = Reading.new(reading_params)

    if @reading.save
      message = 'Reading was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @reading, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /readings/1
  def update
    if @reading.update(reading_params)
      redirect_to @reading, notice: 'Reading was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /readings/1
  def destroy
    @reading.destroy
    message = "Reading was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to readings_url, notice: message
    end
  end


  private

  def current_user_must_be_reading_patient
    set_reading
    unless current_user == @reading.patient
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reading_params
      params.require(:reading).permit(:brain_oxygen_level, :time, :date, :feeling, :self_image, :user_name, :brain_pressure_level, :brain_temperature_level, :physician_id)
    end
end
