class Api::V1::PhysicianInfosController < Api::V1::GraphitiController
  def index
    physician_infos = PhysicianInfoResource.all(params)
    respond_with(physician_infos)
  end

  def show
    physician_info = PhysicianInfoResource.find(params)
    respond_with(physician_info)
  end

  def create
    physician_info = PhysicianInfoResource.build(params)

    if physician_info.save
      render jsonapi: physician_info, status: :created
    else
      render jsonapi_errors: physician_info
    end
  end

  def update
    physician_info = PhysicianInfoResource.find(params)

    if physician_info.update_attributes
      render jsonapi: physician_info
    else
      render jsonapi_errors: physician_info
    end
  end

  def destroy
    physician_info = PhysicianInfoResource.find(params)

    if physician_info.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: physician_info
    end
  end
end
