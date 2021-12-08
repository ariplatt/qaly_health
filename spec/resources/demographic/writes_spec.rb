require "rails_helper"

RSpec.describe DemographicResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "demographics",
          attributes: {},
        },
      }
    end

    let(:instance) do
      DemographicResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Demographic.count }.by(1)
    end
  end

  describe "updating" do
    let!(:demographic) { create(:demographic) }

    let(:payload) do
      {
        data: {
          id: demographic.id.to_s,
          type: "demographics",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      DemographicResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { demographic.reload.updated_at }
      # .and change { demographic.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:demographic) { create(:demographic) }

    let(:instance) do
      DemographicResource.find(id: demographic.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Demographic.count }.by(-1)
    end
  end
end
