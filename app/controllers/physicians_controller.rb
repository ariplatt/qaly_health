class PhysiciansController < ApplicationController
  before_action :set_physician, only: [:show, :edit, :update, :destroy]

  # GET /physicians
  def index
    @physicians = Physician.page(params[:page]).per(10)
  end

  # GET /physicians/1
  def show
    @reading = Reading.new
  end

  # GET /physicians/new
  def new
    @physician = Physician.new
  end

  # GET /physicians/1/edit
  def edit
  end

  # POST /physicians
  def create
    @physician = Physician.new(physician_params)

    if @physician.save
      message = 'Physician was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @physician, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /physicians/1
  def update
    if @physician.update(physician_params)
      redirect_to @physician, notice: 'Physician was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /physicians/1
  def destroy
    @physician.destroy
    message = "Physician was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to physicians_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_physician
      @physician = Physician.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def physician_params
      params.require(:physician).permit(:user_name, :patient, :patient_id, :hospital_id, :hospital_name)
    end
end
