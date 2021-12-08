class Api::V1::DemographicsController < Api::V1::GraphitiController
  def index
    demographics = DemographicResource.all(params)
    respond_with(demographics)
  end

  def show
    demographic = DemographicResource.find(params)
    respond_with(demographic)
  end

  def create
    demographic = DemographicResource.build(params)

    if demographic.save
      render jsonapi: demographic, status: 201
    else
      render jsonapi_errors: demographic
    end
  end

  def update
    demographic = DemographicResource.find(params)

    if demographic.update_attributes
      render jsonapi: demographic
    else
      render jsonapi_errors: demographic
    end
  end

  def destroy
    demographic = DemographicResource.find(params)

    if demographic.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: demographic
    end
  end
end
