class RemoveColumnTags < ActiveRecord::Migration[6.1]
  def change
    remove_column :tags, :post_id
  end
end
