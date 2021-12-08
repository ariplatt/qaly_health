class DemographicsController < ApplicationController
  before_action :set_demographic, only: %i[show edit update destroy]

  def index
    @demographics = Demographic.page(params[:page]).per(10)
  end

  def show
    @physician = Physician.new
  end

  def new
    @demographic = Demographic.new
  end

  def edit; end

  def create
    @demographic = Demographic.new(demographic_params)

    if @demographic.save
      message = "Demographic was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @demographic, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @demographic.update(demographic_params)
      redirect_to @demographic, notice: "Demographic was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @demographic.destroy
    message = "Demographic was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to demographics_url, notice: message
    end
  end

  private

  def set_demographic
    @demographic = Demographic.find(params[:id])
  end

  def demographic_params
    params.require(:demographic).permit(:user_name, :disease_name,
                                        :disease_id, :date_diagnosed, :time_diagnosed, :description_of_illness)
  end
end
