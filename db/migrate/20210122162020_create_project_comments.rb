class CreateProjectComments < ActiveRecord::Migration[6.1]
  def change
    create_table :project_comments do |t|
      t.string :author_name
      t.string :author_email
      t.text :content
      t.integer :project_id

      t.timestamps
    end
  end
end
