
require_relative '../lib/jsonable'

class MyClass
  include Jsonable

  attr_accessor :x, :y, :h, :other_class

end
