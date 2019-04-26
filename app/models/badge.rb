class Badge < ApplicationRecord
  belongs_to :badge_rule, class_name: 'BadgeRule', foreign_key: 'rule_id'

  validates :name, presence: true
end
