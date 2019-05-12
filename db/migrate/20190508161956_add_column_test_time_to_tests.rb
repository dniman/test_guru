class AddColumnTestTimeToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :test_time, :datetime, null: false, default: Time.parse("00:00:00")
  end
end
