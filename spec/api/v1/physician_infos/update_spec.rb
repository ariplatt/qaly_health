require "rails_helper"

RSpec.describe "physician_infos#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/physician_infos/#{physician_info.id}", payload
  end

  describe "basic update" do
    let!(:physician_info) { create(:physician_info) }

    let(:payload) do
      {
        data: {
          id: physician_info.id.to_s,
          type: "physician_infos",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PhysicianInfoResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { physician_info.reload.attributes }
    end
  end
end
