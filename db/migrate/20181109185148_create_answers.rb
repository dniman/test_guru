class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.integer :correct, default: 0
      t.references :question, null: false

      t.timestamps
    end
  end
end
