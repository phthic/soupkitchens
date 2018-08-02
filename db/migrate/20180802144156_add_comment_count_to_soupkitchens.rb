class AddCommentCountToSoupkitchens < ActiveRecord::Migration[5.2]
  def change
    add_column :soupkitchens, :comments_count, :integer, default: 0
  end
end
