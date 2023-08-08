require 'rails_helper'

RSpec.describe Hospital do
  describe "associations" do
    it {should have_many :doctors}
  end
end