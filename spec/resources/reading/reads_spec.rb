require 'rails_helper'

RSpec.describe ReadingResource, type: :resource do
  describe 'serialization' do
    let!(:reading) { create(:reading) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(reading.id)
      expect(data.jsonapi_type).to eq('readings')
    end
  end

  describe 'filtering' do
    let!(:reading1) { create(:reading) }
    let!(:reading2) { create(:reading) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: reading2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([reading2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:reading1) { create(:reading) }
      let!(:reading2) { create(:reading) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            reading1.id,
            reading2.id
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
            reading2.id,
            reading1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
