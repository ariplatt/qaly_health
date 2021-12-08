require "rails_helper"

RSpec.describe "demographics_infos#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/demographics_infos/#{demographics_info.id}"
  end

  describe "basic destroy" do
    let!(:demographics_info) { create(:demographics_info) }

    it "updates the resource" do
      expect(DemographicsInfoResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { DemographicsInfo.count }.by(-1)
      expect { demographics_info.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
