include Warden::Test::Helpers
Warden.test_mode!

feature 'User takes a exam', :devise do
  scenario 'starts the given exam'
  scenario 'sees question text on the page'
  scenario 'sees choices on the page'
  scenario 'submits the answer for question'
  scenario 'navigates to the next question by clicking next'
  scenario 'navigates to the previous question by clicking previous'
  scenario 'flags the question'
  scenario 'submits the question as not sure'
  scenario 'submits answer for all'
end