require "rails_helper"

RSpec.describe PhysicianResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "physicians",
          attributes: {},
        },
      }
    end

    let(:instance) do
      PhysicianResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Physician.count }.by(1)
    end
  end

  describe "updating" do
    let!(:physician) { create(:physician) }

    let(:payload) do
      {
        data: {
          id: physician.id.to_s,
          type: "physicians",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      PhysicianResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { physician.reload.updated_at }
      # .and change { physician.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:physician) { create(:physician) }

    let(:instance) do
      PhysicianResource.find(id: physician.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Physician.count }.by(-1)
    end
  end
end
