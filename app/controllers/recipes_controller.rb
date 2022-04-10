class RecipesController < ApplicationController


    def index
        render json: Recipe.all
    end
    #@current_user= User.find(session[:user_id])
    def create
        newRecipe= @current_user.Recipe.create!(recipe_params)

        render json: newRecipe, status: :created
    end

    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end

 end
