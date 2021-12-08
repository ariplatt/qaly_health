require "rails_helper"

RSpec.describe "reading_for_patients#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/reading_for_patients/#{reading_for_patient.id}",
                payload
  end

  describe "basic update" do
    let!(:reading_for_patient) { create(:reading_for_patient) }

    let(:payload) do
      {
        data: {
          id: reading_for_patient.id.to_s,
          type: "reading_for_patients",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ReadingForPatientResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { reading_for_patient.reload.attributes }
    end
  end
end
