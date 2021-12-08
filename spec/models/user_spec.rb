require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:demographics_infos) }

    it { should have_many(:reading_for_patients) }
  end

  describe "InDirect Associations" do
    it { should have_many(:physician_infos) }
  end

  describe "Validations" do
  end
end
