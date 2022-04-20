require 'rails_helper'
require 'csv'
require 'validadores'
require 'resultados'
require 'calculos'

include ActionDispatch::TestProcess::FixtureFile

RSpec.describe Validadores, type: :lib do
  describe "Importando arquivos" do
    let(:arquivo_valido) { { file: fixture_file_upload('arquivo_valido.csv', 'text/csv') } }
    let(:arquivo_invalido) { { file: fixture_file_upload('arquivo_invalido.csv', 'text/csv') } }

    context "Arquivo valido" do
      it "validando datas" do
        @file = File.open(arquivo_valido[:file])

        CSV.foreach(@file, headers: true, header_converters: :symbol, col_sep: ';') do |row|
          break unless Validadores.data(row[:periodo])
          cliente = Cliente.create!(nome: row[:cliente])
          cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
        end

        expect(Cliente.all.size).to eq(3)
      end

      it "salva arquivo na base e calcula performance total" do
         @file = File.open(arquivo_valido[:file])
         performance_total = 0

         CSV.foreach(@file, headers: true, header_converters: :symbol, col_sep: ';') do |row|
           cliente = Cliente.create!(nome: row[:cliente])
           cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
           performance_total += Calculos.performance(row[:valor_meta], row[:valor_realizado])
          end

          expect(performance_total).to eq(2.283333333333333)
          expect(Cliente.all.size).to eq(3)
      end
    end

    context "Arquivo invalido" do
      it "validando datas" do
        @file = File.open(arquivo_invalido[:file])
        CSV.foreach(@file, headers: true, header_converters: :symbol, col_sep: ';') do |row|
          break unless Validadores.data(row[:periodo])
          cliente = Cliente.create!(nome: row[:cliente])
          cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
         end
         expect(Cliente.all.size).to eq(2)
      end

      it "inserindo linhas na base somente se arquivo valido" do
        @file = File.open(arquivo_valido[:file])
        CSV.foreach(@file, headers: true, header_converters: :symbol, col_sep: ';') do |row|
          break unless Validadores.data(row[:periodo])
          end
          expect(Cliente.all.size).to eq(0)
          #expect(Cliente.find(1).nome).to eq('Cliente 1')
          #expect(Cliente.find(2).nome).to eq('Cliente 2')
      end
    end
  end
end
