class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) } 

  validates :body, presence: true
  validate :validate_answer_count
     
  delegate :answers, to: :question, prefix: true

  private 

  def validate_answer_count
    errors.add(:answers, "too much") if question_answers.size > 4
  end
end
