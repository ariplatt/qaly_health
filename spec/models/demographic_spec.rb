require 'rails_helper'

RSpec.describe Demographic, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:physicians) }

    it { should belong_to(:patient) }

    end

    describe "InDirect Associations" do

    it { should have_one(:diagnosis) }

    end

    describe "Validations" do

    end
end
