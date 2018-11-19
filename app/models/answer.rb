class Answer < ApplicationRecord
  belongs_to :question

  scope :right_answers, -> { where(correct: true) } 

  validations :body, presence: true
end
