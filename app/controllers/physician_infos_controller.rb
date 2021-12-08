class PhysicianInfosController < ApplicationController
  before_action :set_physician_info, only: %i[show edit update destroy]

  def index
    @q = PhysicianInfo.ransack(params[:q])
    @physician_infos = @q.result(distinct: true).includes(:physician,
                                                          :user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @physician_info = PhysicianInfo.new
  end

  def edit; end

  def create
    @physician_info = PhysicianInfo.new(physician_info_params)

    if @physician_info.save
      message = "PhysicianInfo was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @physician_info, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @physician_info.update(physician_info_params)
      redirect_to @physician_info,
                  notice: "Physician info was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @physician_info.destroy
    message = "PhysicianInfo was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to physician_infos_url, notice: message
    end
  end

  private

  def set_physician_info
    @physician_info = PhysicianInfo.find(params[:id])
  end

  def physician_info_params
    params.require(:physician_info).permit(:physician_id, :physician_name,
                                           :hospital_id, :hospital_name)
  end
end
