require "rails_helper"

RSpec.describe "demographics_infos#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/demographics_infos/#{demographics_info.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:demographics_info) { create(:demographics_info) }

    it "works" do
      expect(DemographicsInfoResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("demographics_infos")
      expect(d.id).to eq(demographics_info.id)
    end
  end
end
