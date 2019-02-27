class CreateUserGists < ActiveRecord::Migration[5.2]
  def change
    create_table :user_gists do |t|
      t.references :user, foreign_key: { to_table: :users }, index: true, null: false
      t.references :question, foreign_key: { to_table: :questions }, index: true, null: false
      t.string :gist_url, null: false

      t.timestamps
    end
  end
end
