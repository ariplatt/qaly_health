require "rails_helper"

RSpec.describe "demographics#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/demographics/#{demographic.id}"
  end

  describe "basic destroy" do
    let!(:demographic) { create(:demographic) }

    it "updates the resource" do
      expect(DemographicResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Demographic.count }.by(-1)
      expect { demographic.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
