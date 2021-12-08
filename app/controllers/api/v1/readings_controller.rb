class Api::V1::ReadingsController < Api::V1::GraphitiController
  def index
    readings = ReadingResource.all(params)
    respond_with(readings)
  end

  def show
    reading = ReadingResource.find(params)
    respond_with(reading)
  end

  def create
    reading = ReadingResource.build(params)

    if reading.save
      render jsonapi: reading, status: :created
    else
      render jsonapi_errors: reading
    end
  end

  def update
    reading = ReadingResource.find(params)

    if reading.update_attributes
      render jsonapi: reading
    else
      render jsonapi_errors: reading
    end
  end

  def destroy
    reading = ReadingResource.find(params)

    if reading.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: reading
    end
  end
end
