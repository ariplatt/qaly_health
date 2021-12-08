require "rails_helper"

RSpec.describe ReadingForPatientResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "reading_for_patients",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ReadingForPatientResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { ReadingForPatient.count }.by(1)
    end
  end

  describe "updating" do
    let!(:reading_for_patient) { create(:reading_for_patient) }

    let(:payload) do
      {
        data: {
          id: reading_for_patient.id.to_s,
          type: "reading_for_patients",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ReadingForPatientResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { reading_for_patient.reload.updated_at }
      # .and change { reading_for_patient.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:reading_for_patient) { create(:reading_for_patient) }

    let(:instance) do
      ReadingForPatientResource.find(id: reading_for_patient.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { ReadingForPatient.count }.by(-1)
    end
  end
end
