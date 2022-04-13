class CreateResultados < ActiveRecord::Migration[5.2]
  def change
    create_table :resultados do |t|
      t.date :periodo

      t.references :cliente, index: true

      t.decimal :valor_meta, precision: 10, scale: 2
      t.decimal :valor_realizado, precision: 10, scale: 2

      t.timestamps


    end
  end
end
