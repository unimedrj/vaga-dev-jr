class Calculos
  def self.performance(valor_meta, valor_realizado)
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
end
