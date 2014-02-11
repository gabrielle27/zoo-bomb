require 'test_helper'

class AnimalsControllerTest < ActionController::TestCase
  setup do
    @animal  = FactoryGirl::create(:animal)
  end

  test "should get index" do
    get :index, zoo_id: @animal.zoo_id
    assert_response :success

    assert_not_nil assigns(:animals)
  end

  test "should get new" do
    @new_animal  = FactoryGirl::build(:animal)
    get :new, zoo_id: @new_animal.zoo_id
    assert_response :success
  end

  test "should create animal" do
    @new_animal  = FactoryGirl::build(:animal)
    assert_difference("Animal.count") do
      post :create, zoo_id: @new_animal.zoo, animal: { name: "New Animal", species_attributes: { name: "SubSpecies" } }
    end

    assert_redirected_to zoo_animal_path(@new_animal.zoo, assigns(:animal))
  end

  test "should show animal" do
    get :show, zoo_id: @animal.zoo, id: @animal
    assert_response :success
  end

  test "should get edit" do
    get :edit, zoo_id: @animal.zoo, id: @animal
    assert_response :success
  end

  test "should update animal" do
    patch :update, zoo_id: @animal.zoo_id, id: @animal.id, animal: { name: @animal.name }
    assert_redirected_to zoo_animal_path(@animal.zoo, assigns(:animal))
  end

  test "should destroy animal" do
    assert_difference("Animal.count", -1) do
      delete :destroy, zoo_id: @animal.zoo_id, id: @animal
    end

    assert_redirected_to zoo_animals_path
  end
end
