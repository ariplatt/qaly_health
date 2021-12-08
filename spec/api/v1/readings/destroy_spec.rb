require "rails_helper"

RSpec.describe "readings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/readings/#{reading.id}"
  end

  describe "basic destroy" do
    let!(:reading) { create(:reading) }

    it "updates the resource" do
      expect(ReadingResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Reading.count }.by(-1)
      expect { reading.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
