require 'rails_helper'

RSpec.describe Demographic, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:patient) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
