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
