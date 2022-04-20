class Resultados
  attr_accessor :valor_meta, :valor_realizado, :valor_performance

  def initialize()
    @valor_meta = valor_meta
    @valor_realizado = valor_realizado
    @valor_performance = valor_performance
  end

  def calcula_performance
    if valor_meta.to_f < 0 then
      return nil
    elsif valor_realizado.to_f < 0 then
      return nil
    else
      if valor_meta.nil? then
        return nil
      elsif valor_meta == 0
        return nil
      elsif valor_realizado.nil? then
        return nil
      elsif valor_realizado == 0
        return 0
      else
        valor_realizado.to_f / valor_meta.to_f
      end
    end
  end

  def calcula_realizado
    if valor_meta.to_f < 0 then
      return nil
    elsif valor_performance.to_f < 0 then
      return nil
    else
      if valor_meta.nil? then
        return nil
      elsif valor_meta == 0
        return nil
      elsif valor_performance.nil? then
        return nil
      elsif valor_performance == 0
        return 0
      else
        valor_meta.to_f * valor_performance.to_f
      end
    end
    
  end
end
