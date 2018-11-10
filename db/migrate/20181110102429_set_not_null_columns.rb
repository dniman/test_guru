class SetNotNullColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :categories, :title, :string, null: false
    change_column :tests, :title, :string, null: false
    change_column :tests, :category_id, :integer, null: false
    change_column :questions, :body, :string, null: false
    change_column :questions, :test_id, :integer, null: false
    change_column :answers, :body, :string, null: false
    change_column :answers, :question_id, :integer, null: false
    change_column :users, :name, :string, null: false
  end
end
