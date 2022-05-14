require 'calculos_controller'

class Resultados
  attr_accessor :valor_meta, :valor_realizado, :valor_performance

  def initialize()
    @valor_meta = valor_meta
    @valor_realizado = valor_realizado
    @valor_performance = valor_performance
  end

  def calcula_performance
    return 0 if valor_meta.nil? || valor_meta.zero?
    valor_realizado / valor_meta
  end

  def calcula_realizado
    valor_meta * valor_performance
  end
end
