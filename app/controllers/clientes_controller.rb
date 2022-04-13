class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  def index
    @clientes = Cliente.all
  end

  def show
  end

  def new
    @cliente = Cliente.new
  end

  def edit
  end

  def create
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
      render json: { status: :created, location: @cliente }
    else
      render json: { errors: @cliente.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @cliente.update(cliente_params)
      render json: { status: :ok, location: @cliente }
    else
      render json: { errors: @cliente.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @cliente.destroy
    render json: { status: :no_content }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:nome)
    end
end
