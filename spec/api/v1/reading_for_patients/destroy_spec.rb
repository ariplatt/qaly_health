require "rails_helper"

RSpec.describe "reading_for_patients#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/reading_for_patients/#{reading_for_patient.id}"
  end

  describe "basic destroy" do
    let!(:reading_for_patient) { create(:reading_for_patient) }

    it "updates the resource" do
      expect(ReadingForPatientResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ReadingForPatient.count }.by(-1)
      expect { reading_for_patient.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
