require 'test_helper'

class SoupkitchenCommentTest < ActiveSupport::TestCase

  describe Soupkitchen do
    let(:attributes) do 
      {
        name: "Priscilla's Place"
        address: "1000 Wayne Ave"
        city: "Philadelphia"
        state: "PA"
        zipcode: "19144"
        phone: "215-439-1530"
        indoors: "yes"

      }
    end 

    it "is considered valid" do
      expect(Soupkitchen.new(attributes)).to_be_valid
    end
  # test "the truth" do
  #   assert true
  # end
end
