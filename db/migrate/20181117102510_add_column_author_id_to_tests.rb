class AddColumnAuthorIdToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author, foreign_key: { to_table: :users }, index: true
    change_column_null :tests, :author_id, false
  end
end
