class AddCommentsCountToSoupkitchens < ActiveRecord::Migration[5.2]
  def change

    add_column :soupkitchens, :comments_count, :integer, default: 0
  end

  def data
    execute <<-SQL.squish
        UPDATE posts
           SET comments_count = (SELECT count(1)
                                   FROM comments
                                  WHERE comments.post_id = posts.id)
    SQL
  end
end