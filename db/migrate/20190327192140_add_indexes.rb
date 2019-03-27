class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :questions, :body
    add_index :answers, :body
    add_index :tests, :title 
  end
end
