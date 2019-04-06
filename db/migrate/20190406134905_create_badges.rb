class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :file_name

      t.timestamps
    end
    add_index :badges, :name, unique: true
  end
end
