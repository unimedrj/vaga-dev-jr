require 'calculos_controller'

class Calculos
  def self.performance(valor_meta, valor_realizado)

    return 0 if valor_meta.to_f.zero? || valor_meta.to_f.nil? || valor_realizado.to_f.zero?

    valor_realizado.to_f / valor_meta.to_f
  end
end
