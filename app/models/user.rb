class User < ApplicationRecord
     
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'   

  has_secure_password

  validates :email, presence: true, uniqueness: true 
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_by(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end

