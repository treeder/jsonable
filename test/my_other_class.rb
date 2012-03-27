
require_relative '../lib/jsonable'

class MyOtherClass
  include Jsonable

  attr_accessor :a, :b

end
