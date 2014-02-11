require 'test_helper'

class ZooTest < ActiveSupport::TestCase
  test "should get name" do
    # Appends Zoo when Zoo does not follow the name
    @zoo  = FactoryGirl::build(:zoo, name: "Portland")
    assert @zoo.to_s == @zoo.name + " Zoo"

    # Do not append Zoo when the name is followed by the word Zoo
    @zoo  = FactoryGirl::build(:zoo, name: "Portland Zoo")
    assert @zoo.to_s == @zoo.name

    # Append Zoo when the name ends in zoo but is not a separate word
    @zoo  = FactoryGirl::build(:zoo, name: "Kalamazoo")
    assert @zoo.to_s == @zoo.name + " Zoo"
  end

  test "should get uniqe species" do
    # Zoo - with no animals
    @zoo  = FactoryGirl::create(:zoo, name: "Portland")
    assert @zoo.unique_species_count == 0

    # Zoo with one animal
    @animal = FactoryGirl::create(:animal,
      zoo: @zoo,
      species: FactoryGirl::create(:species, name: "Monkey") )
    assert @animal.zoo.unique_species_count == 1

    # Zoo with 2 animals of the same species
    @animal2 = FactoryGirl::create(:animal,
      zoo: @zoo,
      species: FactoryGirl::create(:species, name: "Monkey") )
    assert @animal2.zoo.unique_species_count == 1

    # Zoo with 2 animals of differing species
    @animal3 = FactoryGirl::create(:animal,
      zoo: @zoo,
      species: FactoryGirl::create(:species, name: "Puma") )
    assert @animal2.zoo.unique_species_count == 2
  end

end
