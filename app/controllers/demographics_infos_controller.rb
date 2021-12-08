class DemographicsInfosController < ApplicationController
  before_action :set_demographics_info, only: %i[show edit update destroy]

  def index
    @q = DemographicsInfo.ransack(params[:q])
    @demographics_infos = @q.result(distinct: true).includes(:user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @demographics_info = DemographicsInfo.new
  end

  def edit; end

  def create
    @demographics_info = DemographicsInfo.new(demographics_info_params)

    if @demographics_info.save
      message = "DemographicsInfo was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @demographics_info, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @demographics_info.update(demographics_info_params)
      redirect_to @demographics_info,
                  notice: "Demographics info was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @demographics_info.destroy
    message = "DemographicsInfo was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to demographics_infos_url, notice: message
    end
  end

  private

  def set_demographics_info
    @demographics_info = DemographicsInfo.find(params[:id])
  end

  def demographics_info_params
    params.require(:demographics_info).permit(:disease_id, :disease_name,
                                              :weight, :height, :dob, :user_id, :user_name)
  end
end
