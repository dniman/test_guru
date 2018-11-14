class CreateUserTests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tests do |t|
      t.references :user, index: true, foreign_key: { to_table: :users }, null: false
      t.references :test, index: true, foreign_key: { to_table: :tests }, null: false
    end
  end
end
