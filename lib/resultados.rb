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
    return 0 if valor_realizado.zero?
    valor_meta * valor_peformance
  end
end
