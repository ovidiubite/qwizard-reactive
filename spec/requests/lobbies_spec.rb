 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/lobbies", type: :request do
  
  # Lobby. As you add validations to Lobby, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Lobby.create! valid_attributes
      get lobbies_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      lobby = Lobby.create! valid_attributes
      get lobby_url(lobby)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_lobby_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      lobby = Lobby.create! valid_attributes
      get edit_lobby_url(lobby)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Lobby" do
        expect {
          post lobbies_url, params: { lobby: valid_attributes }
        }.to change(Lobby, :count).by(1)
      end

      it "redirects to the created lobby" do
        post lobbies_url, params: { lobby: valid_attributes }
        expect(response).to redirect_to(lobby_url(Lobby.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Lobby" do
        expect {
          post lobbies_url, params: { lobby: invalid_attributes }
        }.to change(Lobby, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post lobbies_url, params: { lobby: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested lobby" do
        lobby = Lobby.create! valid_attributes
        patch lobby_url(lobby), params: { lobby: new_attributes }
        lobby.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the lobby" do
        lobby = Lobby.create! valid_attributes
        patch lobby_url(lobby), params: { lobby: new_attributes }
        lobby.reload
        expect(response).to redirect_to(lobby_url(lobby))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        lobby = Lobby.create! valid_attributes
        patch lobby_url(lobby), params: { lobby: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested lobby" do
      lobby = Lobby.create! valid_attributes
      expect {
        delete lobby_url(lobby)
      }.to change(Lobby, :count).by(-1)
    end

    it "redirects to the lobbies list" do
      lobby = Lobby.create! valid_attributes
      delete lobby_url(lobby)
      expect(response).to redirect_to(lobbies_url)
    end
  end
end
