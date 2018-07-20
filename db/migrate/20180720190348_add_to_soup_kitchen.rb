class AddToSoupKitchen < ActiveRecord::Migration[5.2]
  def change
    add_column :soupkitchens, :rating, :string
    remove_column :comments, :rating, :string 
  end
end
