require "rails_helper"

RSpec.describe "demographics_infos#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/demographics_infos", params: params
  end

  describe "basic fetch" do
    let!(:demographics_info1) { create(:demographics_info) }
    let!(:demographics_info2) { create(:demographics_info) }

    it "works" do
      expect(DemographicsInfoResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["demographics_infos"])
      expect(d.map(&:id)).to match_array([demographics_info1.id,
                                          demographics_info2.id])
    end
  end
end
