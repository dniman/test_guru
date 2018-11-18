class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'   
  has_many :questions

  def self.in_descending_order(category_title)
    joins(:category).where(categories: { title: category_title }).order("tests.title desc").pluck("tests.title")
  end
end
