class RemoveTagPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :tag
  end
end
