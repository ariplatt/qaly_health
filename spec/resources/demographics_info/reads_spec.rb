require "rails_helper"

RSpec.describe DemographicsInfoResource, type: :resource do
  describe "serialization" do
    let!(:demographics_info) { create(:demographics_info) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(demographics_info.id)
      expect(data.jsonapi_type).to eq("demographics_infos")
    end
  end

  describe "filtering" do
    let!(:demographics_info1) { create(:demographics_info) }
    let!(:demographics_info2) { create(:demographics_info) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: demographics_info2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([demographics_info2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:demographics_info1) { create(:demographics_info) }
      let!(:demographics_info2) { create(:demographics_info) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      demographics_info1.id,
                                      demographics_info2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      demographics_info2.id,
                                      demographics_info1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
