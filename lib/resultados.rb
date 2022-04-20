class Resultados
  attr_accessor :valor_meta, :valor_realizado, :valor_performance

  def initialize()
    @valor_meta = valor_meta
    @valor_realizado = valor_realizado
    @valor_performance = valor_performance
  end

  def calcula_performance
    if valor_meta.nil? then
      return 0
    elsif valor_meta == 0
      return nil
    elsif valor_realizado == 0
      return 1
    else
      valor_realizado.to_f / valor_meta.to_f
    end
  end

  def calcula_realizado
    valor_meta * valor_performance
  end
end
