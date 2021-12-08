require "rails_helper"

RSpec.describe "demographics#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/demographics/#{demographic.id}", params: params
  end

  describe "basic fetch" do
    let!(:demographic) { create(:demographic) }

    it "works" do
      expect(DemographicResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("demographics")
      expect(d.id).to eq(demographic.id)
    end
  end
end
