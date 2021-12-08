require "rails_helper"

RSpec.describe "physician_infos#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/physician_infos", params: params
  end

  describe "basic fetch" do
    let!(:physician_info1) { create(:physician_info) }
    let!(:physician_info2) { create(:physician_info) }

    it "works" do
      expect(PhysicianInfoResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["physician_infos"])
      expect(d.map(&:id)).to match_array([physician_info1.id,
                                          physician_info2.id])
    end
  end
end
