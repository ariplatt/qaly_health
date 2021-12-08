require "rails_helper"

RSpec.describe ReadingForPatientResource, type: :resource do
  describe "serialization" do
    let!(:reading_for_patient) { create(:reading_for_patient) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(reading_for_patient.id)
      expect(data.jsonapi_type).to eq("reading_for_patients")
    end
  end

  describe "filtering" do
    let!(:reading_for_patient1) { create(:reading_for_patient) }
    let!(:reading_for_patient2) { create(:reading_for_patient) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: reading_for_patient2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([reading_for_patient2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:reading_for_patient1) { create(:reading_for_patient) }
      let!(:reading_for_patient2) { create(:reading_for_patient) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      reading_for_patient1.id,
                                      reading_for_patient2.id,
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
                                      reading_for_patient2.id,
                                      reading_for_patient1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
