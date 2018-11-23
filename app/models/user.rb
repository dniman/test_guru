class User < ApplicationRecord
  has_and_belongs_to_many :tests, :join_table => :user_tests
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'   

  validates :email, presence: true 

  def tests_by(level)
    tests.where(level: level)
  end
end

