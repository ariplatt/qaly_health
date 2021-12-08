require 'rails_helper'

RSpec.describe "physicians#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/physicians/#{physician.id}"
  end

  describe 'basic destroy' do
    let!(:physician) { create(:physician) }

    it 'updates the resource' do
      expect(PhysicianResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Physician.count }.by(-1)
      expect { physician.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
