require "rails_helper"

RSpec.describe PhysicianInfoResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "physician_infos",
          attributes: {},
        },
      }
    end

    let(:instance) do
      PhysicianInfoResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { PhysicianInfo.count }.by(1)
    end
  end

  describe "updating" do
    let!(:physician_info) { create(:physician_info) }

    let(:payload) do
      {
        data: {
          id: physician_info.id.to_s,
          type: "physician_infos",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      PhysicianInfoResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { physician_info.reload.updated_at }
      # .and change { physician_info.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:physician_info) { create(:physician_info) }

    let(:instance) do
      PhysicianInfoResource.find(id: physician_info.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { PhysicianInfo.count }.by(-1)
    end
  end
end
