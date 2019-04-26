class AddColumnRuleIdToBadges < ActiveRecord::Migration[5.2]
  def change
    add_reference :badges, :rule, foreign_key: { to_table: :badge_rules }, index: true
  end
end
