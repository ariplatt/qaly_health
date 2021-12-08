class DemographicsController < ApplicationController
  before_action :set_demographic, only: %i[show edit update destroy]

  def index
    @demographics = Demographic.page(params[:page]).per(10)
  end

  def show; end

  def new
    @demographic = Demographic.new
  end

  def edit; end

  def create
    @demographic = Demographic.new(demographic_params)

    if @demographic.save
      redirect_to @demographic, notice: "Demographic was successfully created."
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
    redirect_to demographics_url,
                notice: "Demographic was successfully destroyed."
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
