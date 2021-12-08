require "rails_helper"

RSpec.describe "reading_for_patients#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/reading_for_patients/#{reading_for_patient.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:reading_for_patient) { create(:reading_for_patient) }

    it "works" do
      expect(ReadingForPatientResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("reading_for_patients")
      expect(d.id).to eq(reading_for_patient.id)
    end
  end
end
