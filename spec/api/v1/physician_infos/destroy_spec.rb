require "rails_helper"

RSpec.describe "physician_infos#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/physician_infos/#{physician_info.id}"
  end

  describe "basic destroy" do
    let!(:physician_info) { create(:physician_info) }

    it "updates the resource" do
      expect(PhysicianInfoResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { PhysicianInfo.count }.by(-1)
      expect { physician_info.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
