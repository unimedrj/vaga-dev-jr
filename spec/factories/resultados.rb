FactoryBot.define do
  factory :resultado do
    cliente
    periodo { Date.today }
    valor_meta { 10 }
    valor_realizado { 12 }
  end
end
