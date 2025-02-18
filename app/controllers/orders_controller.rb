class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show ]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order = CreateOrder.call(params[:items])

    if @order[:error]
      render json: @order, status: :unprocessable_entity
    else
      render json: @order, status: :created
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params.expect(:id))
    end
end
