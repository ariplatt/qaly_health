require 'rails_helper'

RSpec.describe Physician, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:readings) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
