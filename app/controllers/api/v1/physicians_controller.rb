class Api::V1::PhysiciansController < Api::V1::GraphitiController
  def index
    physicians = PhysicianResource.all(params)
    respond_with(physicians)
  end

  def show
    physician = PhysicianResource.find(params)
    respond_with(physician)
  end

  def create
    physician = PhysicianResource.build(params)

    if physician.save
      render jsonapi: physician, status: 201
    else
      render jsonapi_errors: physician
    end
  end

  def update
    physician = PhysicianResource.find(params)

    if physician.update_attributes
      render jsonapi: physician
    else
      render jsonapi_errors: physician
    end
  end

  def destroy
    physician = PhysicianResource.find(params)

    if physician.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: physician
    end
  end
end
