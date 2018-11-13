class CreateUserTests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tests, id: false do |t|
      t.references :user, index: true, foreign_key: { to_table: :users }, null: false
      t.references :test, index: true, foreign_key: { to_table: :tests }, null: false
      t.references :answer, index: true, foreign_key: { to_table: :answers }, null: false
    end
  end
end
