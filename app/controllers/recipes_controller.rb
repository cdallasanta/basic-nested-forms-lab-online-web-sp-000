require 'pry'

class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name:"")
    @recipe.ingredients.build(name:"")
  end

  def create
    binding.pry
    recipe = Recipe.new
    recipe.title = recipe_params[:title]

    recipe.save
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title,
      :ingredients => [
        :name,
        :quantity
      ]
    )
  end
end

# recipe.ingredients_attributes= {
#   "0" => {
#     name: "chocolate",
#     quantity: "many"
#   },
#   "1" => {
#     name: "flour",
#     quantity: "some"
#   }
# }
