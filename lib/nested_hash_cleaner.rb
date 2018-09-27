require_relative "nested_hash_cleaner/version"

module NestedHashCleaner
  def self.clean(x,key)
        case x
        when Hash then x = x.inject({}) {|m, (k, v)| m[k] = clean(v,key) unless k == key ; m }
        when Array then x.map! {|e| clean(e,key)}
        end
        x
  end  
end
