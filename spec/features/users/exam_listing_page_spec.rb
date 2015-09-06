include Warden::Test::Helpers
Warden.test_mode!

# Feature: Exam Listing Page
#   As a user
#   I want to see the list of all Exams
#   So I can choose one exam and start it

feature 'Exam listing(index) page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario
  #   Given I am signed in
  #   When I visit the exam listing page
  #   Then I see a list of exams with exam code
  scenario 'sees list of exams' do
    FactoryGirl.create(:exam, code: 'CS-101', name: 'Introduction to Programming')
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit exams_path
    expect(page).to have_content 'CS-101'
    expect(page).to have_content 'Introduction to Programming'
  end

end
