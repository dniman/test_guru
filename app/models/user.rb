class User < ApplicationRecord
  has_and_belongs_to_many :answers, join_table: :user_answers

  def user_tests(level)
    Test.distinct.joins(questions: [:answers]).where("tests.level = ?", level)
  end
end

