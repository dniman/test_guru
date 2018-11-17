class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'   

  def self.in_descending_order(category_title)
    joins(:category).where(categories: { title: category_title }).order("tests.title desc").pluck("tests.title")
  end
end
