require 'rails_helper'

RSpec.describe "readings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/readings/#{reading.id}", params: params
  end

  describe 'basic fetch' do
    let!(:reading) { create(:reading) }

    it 'works' do
      expect(ReadingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('readings')
      expect(d.id).to eq(reading.id)
    end
  end
end
