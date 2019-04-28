class User < ApplicationRecord
  
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable,
         :validatable,
         :confirmable
     
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'   
  has_many :gists, class_name: 'UserGist'
  has_many :user_badges, class_name: 'UserBadge'
  has_many :badges, through: :user_badges
  
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def tests_by(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
          
  def full_name
   "#{first_name} #{last_name}"
  end

  def admin?
    self.is_a?(Admin)
  end

  def success_test_passages
    test_passages(&:success?)
  end

  def attempt_rule(test)
    test_passages.where(test: test).size.eql?(1) && success_test_passages.where(test: test).size.eql?(1) 
  end

  def category_rule(category)
    success_test_passages.joins(:test).where("tests.category": Category.where(title: category)).size.eql?(Test.where("tests.category": Category.where(title: category)).size)
  end

  def level_rule(level)
    success_test_passages.joins(:test).where("tests.level": level).size.eql?(Test.where(level: level).size) 
  end

  def assign_badge(test)
    user_badges.create(badge: Badge.where(name: "attempt")[0]) if attempt_rule(test)
    user_badges.create(badge: Badge.where(name: "english")[0]) if category_rule("Английский")
    user_badges.create(badge: Badge.where(name: "level#{test.level}")[0]) if level_rule(test.level)
  end
end

