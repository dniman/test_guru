class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :validate_answers
     
  private 
  def validate_answers
    errors.add(:answers, "too little") if answers.size < 1
    errors.add(:answers, "too much") if answers.size > 4
  end
end
