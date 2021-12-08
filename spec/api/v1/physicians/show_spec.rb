require 'rails_helper'

RSpec.describe "physicians#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/physicians/#{physician.id}", params: params
  end

  describe 'basic fetch' do
    let!(:physician) { create(:physician) }

    it 'works' do
      expect(PhysicianResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('physicians')
      expect(d.id).to eq(physician.id)
    end
  end
end
