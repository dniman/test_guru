class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :body
      t.integer :correct
      t.references :question, index: true, foreign_key: { to_table: :questions }

      t.timestamps
    end
  end
end
