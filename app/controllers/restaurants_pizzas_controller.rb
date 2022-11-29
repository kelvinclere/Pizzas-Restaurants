class RestaurantsPizzasController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_errors

    wrap_parameters format: []

    def create 
        @restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
        render json: @restaurant_pizza.pizza, status: :created
    end

    private

    def restaurant_pizza_params
        params.permit(:restaurant_id, :pizza_id, :price)
    end

    def render_errors(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end


end
