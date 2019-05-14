class AddColumnTestTimeToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :timer, :datetime
  end
end
