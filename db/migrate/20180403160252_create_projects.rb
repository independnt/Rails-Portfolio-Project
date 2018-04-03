class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :city
      t.string :state
      t.integer :user_id

      t.timestamps
    end
  end
end
