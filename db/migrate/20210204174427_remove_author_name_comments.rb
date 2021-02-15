class RemoveAuthorNameComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :author_name
  end
end
