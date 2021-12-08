require "rails_helper"

RSpec.describe "physician_infos#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/physician_infos/#{physician_info.id}", params: params
  end

  describe "basic fetch" do
    let!(:physician_info) { create(:physician_info) }

    it "works" do
      expect(PhysicianInfoResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("physician_infos")
      expect(d.id).to eq(physician_info.id)
    end
  end
end
