class ResultadosController < ApplicationController
  before_action :set_resultado, only: [:show, :edit, :update, :destroy]

  def index
    @resultados = Resultado.all
  end

  def show
  end

  def new
    @resultado = Resultado.new
  end

  def edit
  end

  def create
    @resultado = Resultado.new(resultado_params)

    if @resultado.save
      render json: { status: :created, location: @resultado }
    else
      render json: { errors: @resultado.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @resultado.update(resultado_params)
      render json: { status: :ok, location: @resultado }
    else
      render json: { errors: @resultado.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @resultado.destroy
    render json: { status: :no_content }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resultado
      @resultado = Resultado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resultado_params
      params.require(:resultado).permit(:periodo, :valor_meta, :valor_realizado)
    end
end
