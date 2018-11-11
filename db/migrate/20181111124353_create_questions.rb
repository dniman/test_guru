class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :body
      t.references :test, index: true, foreign_key: { to_table: :tests } 

      t.timestamps
    end
  end
end
