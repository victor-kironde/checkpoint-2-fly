require 'rails_helper'

RSpec.describe FlightsController, type: :controller do
  describe '#home' do
    before(:each) { get :home }

    it 'assigns airports' do
      create(:airport)
      expect(assigns(:airports)).to eq Airport.get_airports
    end

    it 'returns a status code of 200' do
      expect(response.status).to eq 200
    end

    it 'renders the home template' do
      expect(response).to render_template('home')
    end
  end

  describe '#index' do
    subject(:flight) { create(:flight) }

    before(:each) do
      get :index, xhr: true, params: {
        origin: flight.origin,
        destination: flight.destination,
        passengers: 1,
        date: flight.departure
      }, format: :js
    end

    it 'returns a status code of 200' do
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end
end
