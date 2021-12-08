require 'rails_helper'

RSpec.describe "physicians#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/physicians/#{physician.id}", payload
  end

  describe 'basic update' do
    let!(:physician) { create(:physician) }

    let(:payload) do
      {
        data: {
          id: physician.id.to_s,
          type: 'physicians',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(PhysicianResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { physician.reload.attributes }
    end
  end
end
