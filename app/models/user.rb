class User < ApplicationRecord
  has_and_belongs_to_many :answers, join_table: :user_answers
end

