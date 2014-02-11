class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]
  before_action :set_species_list, only: [:new, :edit, :update, :create]

  before_filter :load_zoo

  def index
    @animals = @zoo.animals.all
  end

  def show
  end

  def new
    @animal = @zoo.animals.new
    @animal.species = Species.new
  end

  def edit
  end

  def create
    @animal = @zoo.animals.new(animal_params)

    respond_to do |format|
      if @animal.save
        format.html { redirect_to [@zoo,@animal], notice: "Animal was successfully created." }
        format.json { render action: "show", status: :created, location: @animal }
      else
        format.html { render action: "new" }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to [ @zoo, @animal ], notice: "Animal was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to zoo_animals_url(@zoo) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_animal
    @animal = Animal.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def animal_params
    params.require(:animal).permit(:name, species_attributes: [:name])
  end

  def load_zoo
    @zoo = Zoo.find(params[:zoo_id])
  end

  def set_species_list
    @species_list = Species.where.not(name: nil)
  end

end
