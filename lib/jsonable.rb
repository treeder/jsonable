require 'json'
require 'json/add/core' # enables serializing of Time and other things

module Jsonable

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    def json_create(object)
      obj = new
      object.each do |key, value|
        next if key == 'json_class'
        #puts "setting #{key}: #{value}"
        obj.instance_variable_set key, value
        #puts "x = #{obj.x}"
      end
      obj
    end

    def from_json(json_string)
      return JSON.parse(json_string)
    end

  end

  # sets the variables on the current object after json parsing the string.
  def from_json!(string)
    JSON.parse(string).each do |var, val|
      self.instance_variable_set var, val
    end
  end

  def to_json(*a)
    result = {}
    result['json_class'] = self.class.name
    self.instance_variables.each do |var|
      result[var] = self.instance_variable_get var
    end
    result.to_json(*a)
  end

end