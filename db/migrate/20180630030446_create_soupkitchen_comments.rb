class CreateSoupkitchenComments < ActiveRecord::Migration[5.2]
  def change
    create_table :soupkitchen_comments do |t|
    	t.integer :soupkitchen_id
    	t.integer :comment_id
    	t.boolean :admin_approves_comment
      t.timestamps
    end
  end
end
