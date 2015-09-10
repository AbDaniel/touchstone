include Warden::Test::Helpers
Warden.test_mode!

feature 'User starts a exam', :devise do

  before(:each) do
    @user = FactoryGirl.create(:user)
    FactoryGirl.create(:exam, code: 'CS-101', name: 'Introduction to Programming',
                       description: 'Test you Programming Skills', detail: 'A long prog descriptive detail which I dont have time write')
    FactoryGirl.create(:exam, code: 'CS-102', name: 'Introduction to Ruby',
                       description: 'Test you Ruby Skills', detail: 'A long ruby descriptive detail which I dont have time write')
    FactoryGirl.create(:group,
                       name: 'CSE-A',
                       exams: [create(:exam, code: 'CS-101',
                                      name: 'Introduction to Programming',
                                      description: 'Test you Programming Skills',
                                      detail: 'A long prog descriptive detail which I dont have time write'),
                               create(:exam, code: 'CS-102',
                                      name: 'Introduction to Ruby',
                                      description: 'Test you Ruby Skills',
                                      detail: 'A long ruby descriptive detail which I dont have time write')],
                       users: [@user])

  end

  after(:each) do
    Warden.test_reset!
  end

  scenario 'sees list of exams' do
    login_as(@user, scope: :user)
    visit exams_path

    expect(page).to have_content 'CS-101:Introduction to Programming'
    expect(page).to have_content 'Test you Programming Skills'
    expect(page).to have_content 'CS-102:Introduction to Ruby'
    expect(page).to have_content 'Test you Ruby Skills'
  end

  scenario 'navigates to exam details page' do
    login_as(@user, scope: :user)
    visit exams_path
    expect(page).to have_content 'CS-101:Introduction to Programming'
    click_link 'CS-101:Introduction to Programming'

    expect(page).to have_content 'A long prog descriptive detail which I dont have time write'
  end

end
