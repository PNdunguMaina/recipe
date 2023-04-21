class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[edit update destroy]

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
    @recip = Recip.find(params[:recip_id])
    @foods = Food.where.not(id: @recip.foods.pluck(:id))

    return unless @foods.empty?

    redirect_to new_food_path, notice: 'No foods available. Please add a new food.'
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe = Recip.find(params[:recip_id])
    @food = Food.find(params[:recipe_food][:food_id])
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recip = @recipe
    @recipe_food.food = @food

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recip_url(@recipe), notice: 'Food ingredient was successfully added.' }
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_foods_url, notice: 'Recipe food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end
end
