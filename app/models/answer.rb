class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_records, -> { where(correct: true) } 
  scope :question_answers, ->(question) { where(question: question) }

  validates :body, presence: true
  validate :validate_answer_count
     
  private 
  def validate_answer_count
    errors.add(:answers, "too little") if answer_count < 1
    errors.add(:answers, "too much") if answer_count > 4
  end

  def answer_count
    self.class.question_answers(question).size
  end
end
