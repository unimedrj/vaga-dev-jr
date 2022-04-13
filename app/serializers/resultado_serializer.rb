class ResultadoSerializer < ActiveModel::Serializer
  belongs_to :cliente
  attributes :id, :valor_meta, :valor_realizado
end
