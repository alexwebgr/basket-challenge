class CartsController < ApplicationController
  # POST /carts
  def create
    @cart = CreateCart.call(params[:items])

    if @cart[:error]
      render json: @cart, status: :unprocessable_entity
    else
      render json: @cart, status: :created
    end
  end
end
