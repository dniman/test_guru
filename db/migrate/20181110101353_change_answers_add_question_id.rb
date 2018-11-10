class ChangeAnswersAddQuestionId < ActiveRecord::Migration[5.2]
  def change
    change_table :answers do |t|
      t.integer :question_id 
    end
  end
end
