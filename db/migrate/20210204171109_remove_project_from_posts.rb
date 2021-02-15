class RemoveProjectFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :project
  end
end
