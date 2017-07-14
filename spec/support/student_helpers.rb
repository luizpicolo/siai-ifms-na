module StudentHelpers
  def create_new_student(options = {})
    name = options[:name] || Faker::Name.name

    fill_in 'Nome', with: name
    fill_in 'Responsável', with: name
    fill_in 'R.A', with: '12345678'
    fill_in 'Senha para assinatura digital', with: '123456789'
    fill_in 'Confirmar senha', with: '123456789'
    fill_in 'student_responsible', with: name
    fill_in 'student_responsible_contact', with: Fake::Internet.email
    select options[:course], :from => "Turma"
    attach_file('Foto', File.absolute_path('spec/fixtures/logo-ifms.jpg'))

    click_button 'Salvar'
  end
end

RSpec.configure do |config|
  config.include StudentHelpers, type: :feature
end
