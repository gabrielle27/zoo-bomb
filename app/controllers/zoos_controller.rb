class ZoosController < ApplicationController
  before_action :set_zoo, only: [:show, :edit, :update, :destroy]

  def index
    @zoos = Zoo.all
  end

  def show
  end

  def new
    @zoo = Zoo.new
    @zoo.animals.build
  end

  def edit
    @zoo.animals.build
  end

  def create
    @zoo = Zoo.new(zoo_params)

    respond_to do |format|
      if @zoo.save
        format.html { redirect_to @zoo, notice: 'Zoo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @zoo }
      else
        format.html { render action: 'new' }
        format.json { render json: @zoo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @zoo.update(zoo_params)
        format.html { redirect_to @zoo, notice: 'Zoo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @zoo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @zoo.destroy
    respond_to do |format|
      format.html { redirect_to zoos_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_zoo
    @zoo = Zoo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def zoo_params
    params.require(:zoo).permit(:name)
  end
end
