class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :summary
      t.text :content
      t.boolean :published, default: false
      t.integer :priority_order
      t.timestamps
    end
  end
end
