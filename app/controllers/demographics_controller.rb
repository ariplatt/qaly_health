class DemographicsController < ApplicationController
  before_action :set_demographic, only: [:show, :edit, :update, :destroy]

  # GET /demographics
  def index
    @demographics = Demographic.all
  end

  # GET /demographics/1
  def show
  end

  # GET /demographics/new
  def new
    @demographic = Demographic.new
  end

  # GET /demographics/1/edit
  def edit
  end

  # POST /demographics
  def create
    @demographic = Demographic.new(demographic_params)

    if @demographic.save
      redirect_to @demographic, notice: 'Demographic was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /demographics/1
  def update
    if @demographic.update(demographic_params)
      redirect_to @demographic, notice: 'Demographic was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /demographics/1
  def destroy
    @demographic.destroy
    message = "Demographic was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to demographics_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demographic
      @demographic = Demographic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def demographic_params
      params.require(:demographic).permit(:user_name, :disease_name, :disease_id, :date_diagnosed, :time_diagnosed, :description_of_illness)
    end
end
