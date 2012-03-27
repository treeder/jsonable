gem 'test-unit'
require 'test/unit'
require 'yaml'
require_relative 'test_base'
require_relative 'my_class'

class IronCacheTests < TestBase
  def setup
    super

  end

  def test_basics
    c = MyClass.new
    c.x = "abc"
    c.y = 123

    json = c.to_json
    p json

    c2 = JSON.parse(json)
    p c2

    assert_equal c2.class.name, c.class.name
    assert_equal c2.x, c.x
    assert_equal c2.y, c.y

  end


end

