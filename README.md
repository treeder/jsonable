Makes your json classes serializable.

Getting Started
==============

Install the gem:

    sudo gem install jsonable

Include Jsonable in your classes:

    require 'jsonable'
    class MyClass
      include Jsonable
      ....

Then you can serialize and deserialize:

    c = MyClass.new
    c.x = "abc"
    c.y = 123

    # Serialize to json
    json = c.to_json

    # Deserialize back to object
    c2 = JSON.parse(json)

    # now this holds true:
    assert_equal c2.class.name, c.class.name
    assert_equal c2.x, c.x
    assert_equal c2.y, c.y

