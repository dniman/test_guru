module TestsHelper

  def test_level(test)
    test_levels[test.level] || :hero
  end

  def test_levels
    { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze
  end
end
