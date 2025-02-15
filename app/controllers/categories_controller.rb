class CategoriesController < ApplicationController
    def new
        @category = Category.new
    end

    def index
        @categories = Category.all
    end

    def create
    end

    private

    def category_params
        params.require(:category).permit(:category_title)
    end
end
