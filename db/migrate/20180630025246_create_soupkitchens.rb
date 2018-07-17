class CreateSoupkitchens < ActiveRecord::Migration[5.2]
  def change
    create_table :soupkitchens do |t|

    	t.string :name
    	t.string :address
    	t.string :city
    	t.string :state
    	t.string :zipcode
    	t.string :phone
    	t.string :indoors
      t.string :hours
      t.string :website
    
      t.timestamps
    end
  end
end
