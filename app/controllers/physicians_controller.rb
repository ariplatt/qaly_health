class PhysiciansController < ApplicationController
  before_action :set_physician, only: %i[show edit update destroy]

  def index
    @physicians = Physician.page(params[:page]).per(10)
  end

  def show
    @reading = Reading.new
  end

  def new
    @physician = Physician.new
  end

  def edit; end

  def create
    @physician = Physician.new(physician_params)

    if @physician.save
      message = "Physician was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @physician, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @physician.update(physician_params)
      redirect_to @physician, notice: "Physician was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @physician.destroy
    message = "Physician was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to physicians_url, notice: message
    end
  end

  private

  def set_physician
    @physician = Physician.find(params[:id])
  end

  def physician_params
    params.require(:physician).permit(:user_name, :patient, :patient_id,
                                      :hospital_id, :hospital_name)
  end
end
