class Api::V1::ReadingForPatientsController < Api::V1::GraphitiController
  def index
    reading_for_patients = ReadingForPatientResource.all(params)
    respond_with(reading_for_patients)
  end

  def show
    reading_for_patient = ReadingForPatientResource.find(params)
    respond_with(reading_for_patient)
  end

  def create
    reading_for_patient = ReadingForPatientResource.build(params)

    if reading_for_patient.save
      render jsonapi: reading_for_patient, status: :created
    else
      render jsonapi_errors: reading_for_patient
    end
  end

  def update
    reading_for_patient = ReadingForPatientResource.find(params)

    if reading_for_patient.update_attributes
      render jsonapi: reading_for_patient
    else
      render jsonapi_errors: reading_for_patient
    end
  end

  def destroy
    reading_for_patient = ReadingForPatientResource.find(params)

    if reading_for_patient.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: reading_for_patient
    end
  end
end
