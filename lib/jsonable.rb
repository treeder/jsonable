require 'json'
module Jsonable

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    def json_create(object)
      puts 'object=' + object.inspect
      obj = new
      object.each_pair do |key, value|
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

  def from_json!(string)
    JSON.parse(string).each do |var, val|
      self.instance_variable_set var, val
    end
  end

  def to_json(options={})
    puts 'SimpleRecord as_json called with options: ' + options.inspect
    result = {}
    result['json_class'] = self.class.name unless options && options[:exclude_json_class]

    self.instance_variables.each do |var|
      result[var] = self.instance_variable_get var
    end
    result.to_json
  end

end