class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
          
  before_save :before_save_set_next_question, on: :save 

  TEST_PASSED = 85

  def accept!(answer_ids)
    ids = answer_ids.select { |item| item unless item.empty? }
    if correct_answer?(ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def question_num
    test.questions.find_index(current_question) + 1
  end

  def success?
    progress >= TEST_PASSED 
  end

  def progress
    correct_questions/test.questions.count * 100.0
  end

  def time_expired?
    seconds < 0 ? true : false 
  end

  def seconds
    return 0 unless test.timer
    -1 * (Time.current - (created_at + test.timer.seconds_since_midnight))
  end
  private

  def before_save_set_next_question
    self.current_question = persisted? ? next_question : test.questions.first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
