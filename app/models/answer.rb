class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_records, -> { where(correct: true) } 

  validates :body, presence: true
end
