require "rails_helper"

RSpec.describe Reading, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:physician) }

    it { should belong_to(:patient) }
  end

  describe "InDirect Associations" do
    it { should have_one(:demographic) }
  end

  describe "Validations" do
  end
end
