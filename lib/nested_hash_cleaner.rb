require_relative "nested_hash_cleaner/version"

module NestedHashCleaner
  module_function

  def clean(x,key)
    case x
    when Hash then x = x.inject({}) {|m, (k, v)| m[k] = clean(v,key) unless k == key ; m }
    when Array then x.map! {|e| clean(e,key)}
    end
    x
  end

  def clean_with_value(x, value)
    case x
    when Hash then x = x.inject({}) {|m, (k, v)| m[k] = clean_with_value(v,value) unless v == value ; m }
    when Array then x.map! {|e| clean_with_value(e,value)}.compact!
    else x = ((x.respond_to?(:empty?) && x.empty?) ? nil : x)
    end
    x
  end

  def clean_with_values(x, values)
    values.each do |value|
      x = clean_with_value(x, value)
    end
    x
  end

  def clean_empty_values(x)
    clean_with_values(x, [nil, {}, [], ''])
  end
end