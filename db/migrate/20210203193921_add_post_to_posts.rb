class AddPostToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :post, :boolean
  end
end
