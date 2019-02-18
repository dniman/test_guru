class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'   
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  
  LOW_DIFFICULTY = 0..1
  MIDDLE_DIFFICULTY = 2..4
  HIGH_DIFFICULTY = 5..Float::INFINITY

  scope :low_levels, -> { where(level: LOW_DIFFICULTY) }
  scope :middle_levels, -> { where(level: MIDDLE_DIFFICULTY) }
  scope :high_levels, -> { where(level: HIGH_DIFFICULTY) }
  scope :category_tests, ->(title) { joins(:category).where(category: { title: title }) }
                               
  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.in_descending_order(title)
    category_tests(title).order("tests.title desc").pluck("tests.title")
  end

end
