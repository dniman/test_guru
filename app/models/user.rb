class User < ApplicationRecord
  has_many :answers

  def user_tests(level)
    Test.distinct.joins(questions: [:answers]).where("tests.level = ?", level)
  end
end

