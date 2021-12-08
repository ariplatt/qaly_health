require "rails_helper"

RSpec.describe PhysicianInfoResource, type: :resource do
  describe "serialization" do
    let!(:physician_info) { create(:physician_info) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(physician_info.id)
      expect(data.jsonapi_type).to eq("physician_infos")
    end
  end

  describe "filtering" do
    let!(:physician_info1) { create(:physician_info) }
    let!(:physician_info2) { create(:physician_info) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: physician_info2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([physician_info2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:physician_info1) { create(:physician_info) }
      let!(:physician_info2) { create(:physician_info) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      physician_info1.id,
                                      physician_info2.id,
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
                                      physician_info2.id,
                                      physician_info1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
