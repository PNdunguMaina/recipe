class RecipsController < ApplicationController
  before_action :set_recip, only: %i[show edit update destroy]

  # GET /recips or /recips.json
  def index
    @recips = current_user.recips.all
  end

  # GET /recips/1 or /recips/1.json
  def show
    # Retrieve the associated foods for the Recipe from the RecipeFood join table
    @foods = Food.joins(:recipe_foods).where(recipe_foods: { recip_id: @recip.id }).select('foods.*, recipe_foods.quantity AS quantity').order(created_at: :desc)
  end

  # GET /recips/new
  def new
    @recip = Recip.new
  end

  # GET /recips/1/edit
  def edit; end

  # POST /recips or /recips.json
  def create
    @recip = Recip.new(recipe_params)

    respond_to do |format|
      if @recip.save
        format.html { redirect_to recip_url(@recip), notice: 'Recip was successfully created.' }
        format.json { render :show, status: :created, location: @recip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recips/1 or /recips/1.json
  def update
    respond_to do |format|
      if @recip.update(recip_params)
        format.html { redirect_to recip_url(@recip), notice: 'Recip was successfully updated.' }
        format.json { render :show, status: :ok, location: @recip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recips/1 or /recips/1.json
  def destroy
    @recip.destroy

    respond_to do |format|
      format.html { redirect_to recips_url, notice: 'Recip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def public_recipe
    @recipes = Recip.all.where(public: true)
  end

  def generate_shopping_list
    # Get all recipes
    @recipes = Recip.all

    # Initialize an empty hash to store the food quantities needed
    @shopping_list = {}

    # Initialize a variable to store the total value of foods
    @total_value = 0

    # Iterate through each recipe
    @recipes.each do |recipe|
      # Iterate through the RecipeFoods associated with the recipe
      recipe.recipe_foods.each do |recipe_food|
        food = Food.find(recipe_food.food_id)
        quantity = recipe_food.quantity.to_i

        # Add the food and its quantity to the shopping list
        if @shopping_list[food.name]
          @shopping_list[food.name] += quantity

        else
          @shopping_list[food.name] = quantity
        end
        # Calculate the value of the food and add it to the total value
        @total_value += food.price * quantity
      end
    end

    # Get the number of foods needed in the shopping list
    @total_foods = @shopping_list.count
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recip
    @recip = Recip.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  # def recip_params
  #   params.require(:recipe).permit(:name, food_ids: [])
  # end
end
