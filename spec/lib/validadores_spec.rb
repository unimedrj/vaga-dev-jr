require 'rails_helper'
require 'validadores'

RSpec.describe Validadores, type: :lib do
  describe "Validadores" do
    context "data" do
      it "validador data (YYYY-MM-DD)" do
        data = Validadores.data('2019-06-12')

        expect(data).to eq(true)
      end

      it "validador data (YYYY-MM)" do
        # skip("escreva testes para esses casos")
        match_periodo = Validadores.match_periodo('2019-06')

        expect(match_periodo).to eq(true)
      end

      it "validador para data (DD/MM/YYYY)" do
        # skip("escreva testes para esses casos")
        match_full_periodo = Validadores.match_full_periodo('06/06/1981')

        expect(match_full_periodo).to eq(true)
      end
    end

    context "número" do
      it "validador número inteiro" do
        # skip("escreva testes para esses casos")
        def true?(integer)
          integer.to_s.downcase == "true"
        end
        valor = true?(Validadores.valor(1))

        expect(valor).to eq(true)
      end
    end

      it "validador número decimal" do
        # skip("escreva testes para esses casos")
        decimal = Validadores.decimal(10.7)

        expect(decimal).to eq(true)
      end

      it "validador número percentual" do
        # skip("escreva testes para esses casos")
        percentual = Validadores.percentual('10%')

        expect(percentual).to eq(true)
      end

    context "diversos" do
      it "validador e-mail" do
        # skip("escreva testes para esses casos")
        email = Validadores.email('tatchi@lewgon.com')

        expect(email).to eq(true)
      end
    end
  end
end
