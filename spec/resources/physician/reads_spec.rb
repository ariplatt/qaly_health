require 'rails_helper'

RSpec.describe PhysicianResource, type: :resource do
  describe 'serialization' do
    let!(:physician) { create(:physician) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(physician.id)
      expect(data.jsonapi_type).to eq('physicians')
    end
  end

  describe 'filtering' do
    let!(:physician1) { create(:physician) }
    let!(:physician2) { create(:physician) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: physician2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([physician2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:physician1) { create(:physician) }
      let!(:physician2) { create(:physician) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            physician1.id,
            physician2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            physician2.id,
            physician1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
