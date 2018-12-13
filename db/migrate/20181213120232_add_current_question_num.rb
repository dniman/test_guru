class AddCurrentQuestionNum < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :question_num, :integer, null: false, default: 0 
  end
end
