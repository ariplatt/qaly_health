require "rails_helper"

RSpec.describe "demographics_infos#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/demographics_infos/#{demographics_info.id}", payload
  end

  describe "basic update" do
    let!(:demographics_info) { create(:demographics_info) }

    let(:payload) do
      {
        data: {
          id: demographics_info.id.to_s,
          type: "demographics_infos",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(DemographicsInfoResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { demographics_info.reload.attributes }
    end
  end
end
