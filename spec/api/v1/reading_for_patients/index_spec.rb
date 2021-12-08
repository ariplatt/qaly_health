require "rails_helper"

RSpec.describe "reading_for_patients#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/reading_for_patients", params: params
  end

  describe "basic fetch" do
    let!(:reading_for_patient1) { create(:reading_for_patient) }
    let!(:reading_for_patient2) { create(:reading_for_patient) }

    it "works" do
      expect(ReadingForPatientResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["reading_for_patients"])
      expect(d.map(&:id)).to match_array([reading_for_patient1.id,
                                          reading_for_patient2.id])
    end
  end
end
