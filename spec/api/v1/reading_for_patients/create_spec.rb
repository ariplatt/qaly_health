require "rails_helper"

RSpec.describe "reading_for_patients#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/reading_for_patients", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "reading_for_patients",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(ReadingForPatientResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { ReadingForPatient.count }.by(1)
    end
  end
end
