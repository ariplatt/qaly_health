require 'rails_helper'

RSpec.describe "readings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/readings", params: params
  end

  describe 'basic fetch' do
    let!(:reading1) { create(:reading) }
    let!(:reading2) { create(:reading) }

    it 'works' do
      expect(ReadingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['readings'])
      expect(d.map(&:id)).to match_array([reading1.id, reading2.id])
    end
  end
end
