# assign_badge_handler.rb

class AssignBadgeHandler
  attr_reader :user

  def self.execute(test, user)
    self.new(test, user).tap do |handler|
      handler.assign_badge(test)
    end
  end

  def initialize(test, user)
    @user = user
  end

  def assign_badge(test)
    user.user_badges.create(badge: Badge.where(name: "attempt")[0]) if attempt_rule(test)
    user.user_badges.create(badge: Badge.where(name: "english")[0]) if category_rule("Английский")
    user.user_badges.create(badge: Badge.where(name: "level#{test.level}")[0]) if level_rule(test.level)
  end
  
  def success_test_passages
    user.test_passages(&:success?)
  end

  def attempt_rule(test)
    user.test_passages.where(test: test).size.eql?(1) && success_test_passages.where(test: test).size.eql?(1) 
  end

  def category_rule(category)
    success_test_passages.joins(:test).where("tests.category": Category.where(title: category)).size.eql?(Test.where("tests.category": Category.where(title: category)).size)
  end

  def level_rule(level)
    success_test_passages.joins(:test).where("tests.level": level).size.eql?(Test.where(level: level).size) 
  end

end
