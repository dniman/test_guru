class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'   
  has_many :questions
               
  LOW_DIFFICULTY = 0..1
  MIDDLE_DIFFICULTY = 2..4
  HIGH_DIFFICULTY = 5..Float::INFINITY

  scope :low_levels, -> { where(level: LOW_DIFFICULTY) }
  scope :middle_levels, -> { where(level: MIDDLE_DIFFICULTY) }
  scope :high_levels, -> { where(level: HIGH_DIFFICULTY) }
  scope :order_by, ->(attr, direction) { order("tests.#{attr} #{direction}") }
  scope :select_by, ->(attributes) { pluck(attributes.join(",")) }
                               
  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.in_descending_order_by(category_title)
    joins(:category).order_by("title", "desc").select_by(["tests.title"])
  end
end
