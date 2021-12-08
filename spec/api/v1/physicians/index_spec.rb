require "rails_helper"

RSpec.describe "physicians#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/physicians", params: params
  end

  describe "basic fetch" do
    let!(:physician1) { create(:physician) }
    let!(:physician2) { create(:physician) }

    it "works" do
      expect(PhysicianResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["physicians"])
      expect(d.map(&:id)).to match_array([physician1.id, physician2.id])
    end
  end
end
