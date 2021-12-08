require "rails_helper"

RSpec.describe "readings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/readings/#{reading.id}", payload
  end

  describe "basic update" do
    let!(:reading) { create(:reading) }

    let(:payload) do
      {
        data: {
          id: reading.id.to_s,
          type: "readings",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ReadingResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { reading.reload.attributes }
    end
  end
end
