class User < ApplicationRecord
  has_and_belongs_to_many :tests, :join_table => :user_tests

  def tests_by(level)
    tests.where("tests.level = ?", level)
  end
end

