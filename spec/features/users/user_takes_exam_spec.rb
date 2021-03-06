include Warden::Test::Helpers
Warden.test_mode!

feature 'User takes a exam', :devise do

  before(:each) do
    category_list = [
        'Probability', 'Time and Distance', 'Number Theorem', 'Permutations'
    ]
    category_list.each do |category_name|
      Category.create(name: category_name)
    end
    category_probability = Category.find_by_name 'Probability'
    category_time = Category.find_by_name 'Time and Distance'
    category_number = Category.find_by_name 'Number Theorem'
    category_permutation = Category.find_by_name 'Permutations'
    (1..5).each do |index|
      question = Question.create(description: "Prob Question #{index}", categories: [category_probability])
      (1..3).each do |choice_no|
        Choice.create(text: "Choice #{choice_no}", correct: false, question: question)
      end
      Choice.create(text: 'Choice 4', correct: true, question: question)
    end
    (6..10).each do |index|
      question = Question.create(description: "Time Question #{index}", categories: [category_time])
      (1..3).each do |choice_no|
        Choice.create(text: "Choice #{choice_no}", correct: false, question: question)
      end
      Choice.create(text: 'Choice 4', correct: true, question: question)
    end
    (11..15).each do |index|
      question = Question.create(description: "Number Question #{index}", categories: [category_number])
      (1..3).each do |choice_no|
        Choice.create(text: "Choice #{choice_no}", correct: false, question: question)
      end
      Choice.create(text: 'Choice 4', correct: true, question: question)
    end
    (16..20).each do |index|
      question = Question.create(description: "Perm Question #{index}", categories: [category_permutation])
      (1..3).each do |choice_no|
        Choice.create(text: "Choice #{choice_no}", correct: false, question: question)
      end
      Choice.create(text: 'Choice 4', correct: true, question: question)
    end
    exam = Exam.create(code: 'CS-101', name: 'Introduction to Programming',
                       description: 'Test your Programming Skills', detail: 'A Long descriptive detail which I dont have time write')
    exam_configuration = ExamConfiguration.create(exam: exam, duration: '2 hours')
    sections = [[category_probability, 3], [category_time, 3], [category_number, 3], [category_permutation, 3]]

    sections.each do |category, no_of_questions|
      Section.create(category: category, no_of_questions: no_of_questions, exam_configuration: exam_configuration)
    end
  end

  scenario 'sees question text on the page'
  scenario 'sees choices on the page'
  scenario 'submits the answer for question'
  scenario 'navigates to the next question by clicking next'
  scenario 'navigates to the previous question by clicking previous'
  scenario 'flags the question'
  scenario 'submits the question as not sure'
  scenario 'submits answer for all'
end