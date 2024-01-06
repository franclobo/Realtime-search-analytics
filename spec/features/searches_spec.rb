require 'rails_helper'

RSpec.feature 'Searches', type: :feature do
  scenario 'User sees recent searches' do
    # Agrega lógica para crear registros de búsqueda de prueba
    Search.create(query: 'ruby', ip_address: '127.0.0.1', created_at: Time.now)
    Search.create(query: 'rails', ip_address: '127.0.0.1', created_at: Time.now)

    visit root_path

    # Verifica que la página muestre las búsquedas recientes
    expect(page).to have_content('Recent Searches')
    expect(page).to have_css('table.table-striped tbody tr', count: 2)
  end

  scenario 'User can perform a search' do
    visit root_path

    # Ingresa una consulta y realiza una búsqueda
    fill_in 'search[query]', with: 'ruby on rails'
    click_button 'Search'

    # Verifica que la página muestre la nueva búsqueda en los resultados
    expect(page).to have_content('Recent Searches')
    expect(page).to have_content('ruby on rails')
  end
end
