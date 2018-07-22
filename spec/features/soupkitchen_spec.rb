#Feature tests are traditionally located in spec/features, but you can put them anywhere if you pass the :type => :feature option to your describe call.

# describe "soupkitchen creation", type: :feature do
#   before do
#     visit new_soupkitchen_path
#     fill_in "name", with: "Priscilla's Place"
#     fill_in "address" with: "2000 Wayne Avenue"
#     fill_in "city" with: "Philadelphia"
#     fill_in "state" with: "PA"
#     click_button "Create soupkitchen"
#   end 

#   let(:soupkitchen) {
#     Soupkitchen.find_by(name: "Priscilla's Place")
#      it "creates a soupkitchen" do 
#       expect(soupkitchen).to_not be_nil
#     end

#     it "redirects to the new soupkitchen's page" do 
#       expect(current_path).to eq(monster_path(monster))
#     end 

#     it "displays the soupkitchen's name" do 
#       within "h2" do 
#         expect(page).to have_content(soupkitchen.name)
#       end


#     }

#     it "has many comments" do 

#     end

#     it "has many users through comments" do 
#     end 

#     it "is valid with a name, address, phone number XXXETCETC" do 
#     end  
#   end 

    # hard part of testing is the "why"
    # for standard CRUD function, Capy is really good. If say, lots of authorization-level-based redirects, better to write a controller test
    

 
