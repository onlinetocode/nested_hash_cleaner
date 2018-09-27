require_relative '../../test_helper'

describe NestedHashCleaner do

  def setup
    @hash = {a: {b: 4, c: 5}, b: [{a: 2, c: 4, d: 1}, {b: 5, c: 4}]}
    @array_of_hashes = [{a: 1, b: 3}, {a: 2, c: 4, d: 1}, {b: 5, c: 4}]
  end
    
  it "must respond to clean" do
    NestedHashCleaner.must_respond_to(:clean)
  end

  it "must clean hash" do
    cleaned = NestedHashCleaner.clean(@hash, :a)
    assert_equal cleaned, {b: [{c: 4, d: 1}, {b: 5, c: 4}]}
  end

  it "must clean array of hashes" do
    cleaned = NestedHashCleaner.clean(@array_of_hashes, :a)
    assert_equal cleaned, [{b: 3}, {c: 4, d: 1}, {b: 5, c: 4} ]
  end
end
