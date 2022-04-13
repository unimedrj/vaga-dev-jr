require 'rails_helper'

RSpec.describe CalculosController, type: :controller do
  let(:cliente) {
    create(:cliente)
  }

  let(:valid_attributes) {
    { cliente_id: cliente.id, periodo: Date.today, valor_meta: 10.5, valor_realizado: 12.7 }
  }

  let(:invalid_valid_attributes) {
    { cliente_id: cliente.id, periodo: Date.today, valor_meta: 0.0, valor_realizado: 12.7 }
  }

  let(:valid_session) { {} }

  describe "GET #performance" do
    it "com atributos validos" do
      resultado = Resultado.create! valid_attributes
      get :performance, params: {valor_meta: resultado.valor_meta, valor_realizado: resultado.valor_realizado}, session: valid_session
      expect(response).to be_successful
    end

    it "com atributos inválidos" do
      resultado = Resultado.create! valid_attributes
      get :performance, params: {valor_meta: resultado.valor_meta, valor_realizado: resultado.valor_realizado}, session: valid_session
      expect(response).to be_successful
    end
  end
end
