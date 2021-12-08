require "rails_helper"

RSpec.describe DemographicsInfoResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "demographics_infos",
          attributes: {},
        },
      }
    end

    let(:instance) do
      DemographicsInfoResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { DemographicsInfo.count }.by(1)
    end
  end

  describe "updating" do
    let!(:demographics_info) { create(:demographics_info) }

    let(:payload) do
      {
        data: {
          id: demographics_info.id.to_s,
          type: "demographics_infos",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      DemographicsInfoResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { demographics_info.reload.updated_at }
      # .and change { demographics_info.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:demographics_info) { create(:demographics_info) }

    let(:instance) do
      DemographicsInfoResource.find(id: demographics_info.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { DemographicsInfo.count }.by(-1)
    end
  end
end
