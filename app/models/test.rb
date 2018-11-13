class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  def self.in_descending_order(category_title)
    self.joins(:category).where("categories.title = ?", category_title).order("tests.title desc").pluck("tests.title")
  end
end
