require 'rails_helper'

RSpec.describe DemographicResource, type: :resource do
  describe 'serialization' do
    let!(:demographic) { create(:demographic) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(demographic.id)
      expect(data.jsonapi_type).to eq('demographics')
    end
  end

  describe 'filtering' do
    let!(:demographic1) { create(:demographic) }
    let!(:demographic2) { create(:demographic) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: demographic2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([demographic2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:demographic1) { create(:demographic) }
      let!(:demographic2) { create(:demographic) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            demographic1.id,
            demographic2.id
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
            demographic2.id,
            demographic1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
