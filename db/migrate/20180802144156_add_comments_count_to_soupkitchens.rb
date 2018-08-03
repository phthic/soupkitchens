class AddCommentsCountToSoupkitchens < ActiveRecord::Migration[5.2]
  def change
    add_column :soupkitchens, :comments_count, :integer, :default => 0
    
    Soupkitchen.reset_column_information

    Soupkitchen.find_each do |s|
      s.update_attribute :comments_count, s.comments.length
    end

  end
end
