class CreateSoupkitchens < ActiveRecord::Migration[5.2]
  def change
    create_table :soupkitchens do |t|

    	t.string :name
    	t.string :address
    	t.string :city
    	t.string :state
    	t.integer :zipcode
    	t.integer :phone
    	t.boolean :indoors
    	

      t.timestamps
    end
  end
end
