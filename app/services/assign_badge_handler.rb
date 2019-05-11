# assign_badge_handler.rb
require 'forwardable'

class AssignBadgeHandler
  extend Forwardable

  attr_reader :test

  def_delegators :@user, :user_badges, :test_passages
  def_delegator :@test, :test_level

  def self.call(test, user)
    new(test, user).tap do |handler|
      handler.assign_badge
    end
  end

  def initialize(test, user)
    @user = user
    @test = test
  end

  def assign_badge
    Badge.all.each do |item|
      user_badges.create(badge: item) if assigning_method(item.rule_type, item.rule_value)
    end
  end

  def rule_method(rule_type)
    "#{Badge.rule_types.key(rule_type)}_rule"
  end

  def assigning_method(rule_type, rule_value)
    send(rule_method(rule_type), rule_value)
  end

  def success_test_passages
    test_passages(&:success?)
  end

  def attempt_rule(value)
    test_passages.where(test: test).size.eql?(value.to_i) && success_test_passages.where(test: test).size.eql?(value.to_i) 
  end

  def category_by_rule(category)
    success_test_passages.joins(:test).where("tests.category": Category.where(title: category)).size.eql?(Test.where("tests.category": Category.where(title: category)).size)
  end

  def level_by_rule(level)
    level.eql?(level.to_i) && success_test_passages.joins(:test).where("tests.level": level).size.eql?(Test.where(level: level).size) 
  end

  def empty_rule(level)
    false
  end

end
