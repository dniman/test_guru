class BadgeRule < ApplicationRecord
  has_many :badges

  validates :name, presence: true
end
