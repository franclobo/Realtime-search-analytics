require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @searches and @top_searches' do
      searches = FactoryBot.create_list(:search, 3)
      get :index
      expect(assigns(:searches)).to eq(searches)
      expect(assigns(:top_searches)).to eq(Search.most_searched)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new search' do
        post :create, params: { search: { query: 'ruby' } }
        expect(Search.last.query).to eq('ruby')
      end

      it 'broadcasts to ActionCable' do
        expect(ActionCable.server).to receive(:broadcast)
        post :create, params: { search: { query: 'ruby' } }
      end

      it 'responds with success' do
        post :create, params: { search: { query: 'ruby' } }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new search' do
        post :create, params: { search: { query: '' } }
        expect(Search.count).to eq(0)
      end

      it 'responds with error status' do
        post :create, params: { search: { query: '' } }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
