require 'test_helper'
require 'minitest/byebug' if ENV['DEBUG']

class StattleshipHelperTest < ActiveSupport::TestCase
  test "should call statleship properly" do
     
    loader = StattleshipHelper::Loader.new
    loader.load
    assert_not_nil( loader.games )
     
     
  end
end
