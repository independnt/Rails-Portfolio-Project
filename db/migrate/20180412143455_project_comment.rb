class ProjectComment < ActiveRecord::Migration[5.1]
  def change
    create_table :project_comments do |t|
      t.integer :project_id
      t.integer :user_id
      t.text :comment
    end
  end
end
