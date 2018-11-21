class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_records, -> { where(correct: true) } 

  validates :body, presence: true
  validate :validate_answer_count
     
  private 
  def validate_answer_count
    errors.add(:answers, "too little") if answer_count < 1
    errors.add(:answers, "too much") if answer_count > 4
  end

  def answer_count
    question.answers.size
  end
end
