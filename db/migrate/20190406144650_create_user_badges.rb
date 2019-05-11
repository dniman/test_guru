class CreateUserBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_badges do |t|
      t.references :user, index: true, foreign_key: { to_table: :users }, null: false
      t.references :badge, index: true, foreign_key: { to_table: :badges }, null: false

      t.timestamps
    end
  end
end
