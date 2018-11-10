class AddDefaultValues < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:tests, :level, 0)
    change_column_default(:answers, :correct, false)
    change_column_default(:users, :is_admin, false)
  end
end
