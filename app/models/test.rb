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
  scope :in_descending_order, ->(category_title) do
    joins(:category).where(categories: { title: category_title }).order("tests.title desc").pluck("tests.title")
  end

  validates :title, presence: true 
end
