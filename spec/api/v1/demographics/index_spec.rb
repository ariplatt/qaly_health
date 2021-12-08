require 'rails_helper'

RSpec.describe "demographics#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/demographics", params: params
  end

  describe 'basic fetch' do
    let!(:demographic1) { create(:demographic) }
    let!(:demographic2) { create(:demographic) }

    it 'works' do
      expect(DemographicResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['demographics'])
      expect(d.map(&:id)).to match_array([demographic1.id, demographic2.id])
    end
  end
end
