require 'rails_helper'
require 'json'

RSpec.describe ClientesController, type: :controller do

  let(:valid_attributes) { { nome: "unimedrj" } }

  let(:invalid_attributes) { { nome: "VictorTesteNomeMaiorQueOPermitido" } }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      cliente = Cliente.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      cliente = Cliente.create! valid_attributes
      get :show, params: {id: cliente.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Cliente" do
        expect {
          post :create, params: {cliente: valid_attributes}, session: valid_session
        }.to change(Cliente, :count).by(1)
      end
    end
  end

  describe "POST #create" do
  context "with invalid params" do
    it "creates a new Cliente" do
        post :create, params: {cliente: invalid_attributes}, session: valid_session
        
        expect(JSON.parse(response.body)).to eq("errors"=>{"nome"=>["is too long (maximum is 20 characters)"]}, "status"=>"unprocessable_entity")
    end
  end
end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {nome: 'VictorTeste'}
      }

      it "updates the requested cliente" do
        cliente = Cliente.create! valid_attributes
        put :update, params: {id: cliente.to_param, cliente: new_attributes}, session: valid_session
        cliente.reload
        expect(cliente.nome).to eq('VictorTeste')
      end

      it "renders a JSON response with the cliente" do
        cliente = Cliente.create! valid_attributes
        put :update, params: {id: cliente.to_param, cliente: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cliente" do
      cliente = Cliente.create! valid_attributes
      expect {
        delete :destroy, params: {id: cliente.to_param}, session: valid_session
      }.to change(Cliente, :count).by(-1)
    end
  end

end
