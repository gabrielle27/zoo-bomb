require 'test_helper'

class SpeciesTest < ActiveSupport::TestCase
  setup do
    @species = animals(:one)
  end

  test "should get name" do
    assert @species.to_s == @species.name
  end
end
