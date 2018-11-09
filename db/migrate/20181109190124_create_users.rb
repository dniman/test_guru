class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :is_admin, default: 0

      t.timestamps
    end
  end
end
