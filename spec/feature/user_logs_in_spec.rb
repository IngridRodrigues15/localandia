require 'rails_helper'


feature 'User logs in' do
  scenario 'succesfully' do
    #arrange
    user = create(:user, email: 'marcelo@teste.com', password: '123456')
    #act
    visit root_path
    within('.header') do
      click_on 'Entrar'
    end
    within('.formulario') do
      fill_in 'E-mail', with: user.email
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
   end
    #assert
    expect(current_path).to eq root_path
    expect(page).to have_content("Olá, #{user.email}")
    expect(page).to have_link('Sair')
    expect(page).not_to have_link('Entrar')
  end

  scenario 'and must be registered' do
    #act
    visit root_path
    within('.header') do
      click_on 'Entrar'
    end
    within('.formulario') do
      fill_in 'E-mail', with: 'marcelo@teste.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
   end
    #assert
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content('E-mail ou senha inválida')
  end

  scenario 'and logs out succesflly' do
    #arrange
    user = create(:user, email: 'marcelo@teste.com', password: '123456')
    #act
    visit root_path
    within('.header') do
      click_on 'Entrar'
    end
    within('.formulario') do
      fill_in 'E-mail', with: user.email
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
   end
    click_on 'Sair'
    #assert
    expect(current_path).to eq new_user_session_path
    expect(page).to have_link('Entrar')
    expect(page).not_to have_content("Olá, #{user.email}")
    expect(page).not_to have_link('Sair')
  end
end
