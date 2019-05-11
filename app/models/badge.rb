class Badge < ApplicationRecord
  enum rule_types: { empty: 0, attempt: 1, category_by: 2, level_by: 3 }
  
  validates :name, presence: true
end
