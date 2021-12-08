require "rails_helper"

RSpec.describe ReadingResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "readings",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ReadingResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Reading.count }.by(1)
    end
  end

  describe "updating" do
    let!(:reading) { create(:reading) }

    let(:payload) do
      {
        data: {
          id: reading.id.to_s,
          type: "readings",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ReadingResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { reading.reload.updated_at }
      # .and change { reading.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:reading) { create(:reading) }

    let(:instance) do
      ReadingResource.find(id: reading.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Reading.count }.by(-1)
    end
  end
end
