class AddColumnsToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :start_time, :datetime, null: false, default: Time.parse("00:00:00")
    add_column :test_passages, :end_time, :datetime, null: false, default: Time.parse("00:00:00")
  end
end
