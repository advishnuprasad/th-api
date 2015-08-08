class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :answer
      t.integer :level
      t.boolean :is_last_level, default: false

      t.timestamps
    end
  end
end
