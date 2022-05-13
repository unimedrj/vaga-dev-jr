require 'rails_helper'
require 'calculos'

RSpec.describe Calculos, type: :lib do
  describe "Calcula performance" do
    it "com atributos validos" do
      valor_performance = Calculos.performance(100.5, 150.5)

      expect(valor_performance).to eq(1.4975124378109452)
    end

    it "com valor realizado valido e meta zero" do
      valor_performance = Calculos.performance(0.0, 150.5)

      expect(valor_performance).to eq(0)
    end

    it "com valor realizado valido e meta null" do
      #skip("escreva testes para esses casos")
      resultado = Resultados.new
      resultado.valor_meta = nil
      resultado.valor_realizado = 20

      expect(resultado.calcula_performance).to eq(0)
    end

    it "com valor meta valido e realizado zero" do
      #skip("escreva testes para esses casos")
      resultado = Resultados.new
      resultado.valor_meta = 10
      resultado.valor_realizado = 0

      expect(resultado.calcula_performance).to eq(0)
    end
  end
end
