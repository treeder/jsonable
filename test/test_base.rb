gem 'test-unit'
require 'test/unit'
require 'yaml'

begin
  require File.join(File.dirname(__FILE__), '../lib/jsonable')
rescue Exception => ex
  puts "Could NOT load current iron_cache: " + ex.message
  raise ex
end


class TestBase < Test::Unit::TestCase

  def setup

  end

end
