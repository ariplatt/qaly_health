require 'rails_helper'

RSpec.describe "demographics#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/demographics/#{demographic.id}", payload
  end

  describe 'basic update' do
    let!(:demographic) { create(:demographic) }

    let(:payload) do
      {
        data: {
          id: demographic.id.to_s,
          type: 'demographics',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(DemographicResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { demographic.reload.attributes }
    end
  end
end
