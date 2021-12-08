class Api::V1::DemographicsInfosController < Api::V1::GraphitiController
  def index
    demographics_infos = DemographicsInfoResource.all(params)
    respond_with(demographics_infos)
  end

  def show
    demographics_info = DemographicsInfoResource.find(params)
    respond_with(demographics_info)
  end

  def create
    demographics_info = DemographicsInfoResource.build(params)

    if demographics_info.save
      render jsonapi: demographics_info, status: :created
    else
      render jsonapi_errors: demographics_info
    end
  end

  def update
    demographics_info = DemographicsInfoResource.find(params)

    if demographics_info.update_attributes
      render jsonapi: demographics_info
    else
      render jsonapi_errors: demographics_info
    end
  end

  def destroy
    demographics_info = DemographicsInfoResource.find(params)

    if demographics_info.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: demographics_info
    end
  end
end
