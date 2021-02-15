class DropProjectComments < ActiveRecord::Migration[6.1]
  def change
    drop_table :project_comments
  end
end
