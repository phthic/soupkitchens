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
    # RSPEC matchers + predicate matchers (return true/false, named with question mark at the end, to_be_valid = valid? )

    let (:missing_name) {attributes.except(:name) }
    let(:invalid_address {attributes.merge(state: "PA")}
    let(:indoors) {attributes.merge(indoors: "no")}

    it "is invalid without a name" do 
      expect(Soupkitchen.new(missing_name)).not_to be_valid
    end

    it "is invalid with an unusual state" do
      expect(Soupkitchen.new(invalid_size)).not_to be_valid
    end 

    it "is invalid with a missing address" do
      expect(Monster.new(missing_species)).not_to be_valid
    end 
    # older tests have 'should'-- depracated to 'expect'

# controllr tests -- watch out for redundancy 
  #controller tests 

    describe SoupkitchensController, type: :controller  do
      let(:attributes)  do      
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

    it "renders the show template" do 
     soupkitchen = Soupkitchen.create! (attributes)
      get :show, id: soupkitchen.id
      expect(response).to render_template(:show)
    end

    describe "creation" do
      before {post :create, soupkitchen: attributes }
      let(:soupkitchen) {
        Soupkitchen.find_by(name: "Priscilla's Place") }
      it "creates a new soupkitchen" do
        expect(soupkitchen).to_not be_nil
      end 

      it "redirects to the soupkitchen's show page" do 
        expect(response).to redirect_to(moster_path(monster))
      end
    end
  end
  # you can us get/post/patch/delete to initiate test requests. response object available, to set expectations, like render_template or redirect_to 

  #Feature tests 
      }

  # test "the truth" do
  #   assert true
  # end
end
