class AddAddedByToSoupkitchen < ActiveRecord::Migration[5.2]
  def change
    add_column :soupkitchens, :added_by, :string
  end
end
