class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.references :category, index: true, foreign_key: { to_table: :categories }

      t.timestamps
    end
  end
end
