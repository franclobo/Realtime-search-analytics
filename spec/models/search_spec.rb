require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:query) }
  end

  describe 'methods' do
    describe '.most_searched' do
      it 'returns the most searched queries' do
        # Agrega lógica para crear registros de prueba
        # Asegúrate de que algunos registros tengan la misma consulta (query) para probar el método
        Search.create(query: 'ruby')
        Search.create(query: 'rails')
        Search.create(query: 'ruby')

        most_searched = Search.most_searched
        expect(most_searched.keys).to eq(['ruby', 'rails'])
        expect(most_searched['ruby']).to eq(2)
        expect(most_searched['rails']).to eq(1)
      end
    end

    describe '.delete_all_searches' do
      it 'deletes all searches' do
        # Agrega lógica para crear algunos registros de prueba
        Search.create(query: 'test1')
        Search.create(query: 'test2')

        Search.delete_all_searches

        expect(Search.count).to eq(0)
      end
    end
  end
end
