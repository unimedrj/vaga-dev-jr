class Cliente < ApplicationRecord
  has_many :resultado
  validates :nome, length: { maximum: 20 }
end
