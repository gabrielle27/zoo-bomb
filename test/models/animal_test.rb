require 'test_helper'

class AnimalTest < ActiveSupport::TestCase
  setup do
    @animal = animals(:one)
  end

  test "should get name" do
    assert @animal.to_s == @animal.name
  end
end
