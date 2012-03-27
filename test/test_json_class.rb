gem 'test-unit'
require 'test/unit'
require 'yaml'
require_relative 'test_base'
require_relative 'my_class'
require_relative 'my_other_class'

class IronCacheTests < TestBase
  def setup
    super

  end

  def test_basics
    c = MyClass.new
    c.x = "abc"
    c.y = 123
    c.h = {'hx'=>"def", 'hy'=>456}

    json = c.to_json
    p json

    c2 = JSON.parse(json)
    p c2

    assert_equal c2.class.name, c.class.name
    assert_equal c2.x, c.x
    assert_equal c2.y, c.y
    assert_equal c2.h, c.h
    assert_nil c2.other_class


    # Now for subclasses
    c.other_class = MyOtherClass.new
    c.other_class.a = "hi"
    c.other_class.b = [1,2]
    json = c.to_json
    p json

    c2 = JSON.parse(json)
    p c2

    assert_equal c2.class.name, c.class.name
    assert_equal c2.x, c.x
    assert_equal c2.y, c.y
    assert_equal c2.h, c.h
    assert_equal c2.other_class.a, c.other_class.a
    assert_equal c2.other_class.b, c.other_class.b


  end


end

