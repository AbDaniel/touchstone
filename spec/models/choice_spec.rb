describe Choice do
  describe '#valid?' do
    it 'is invalid without text' do
      choice = FactoryGirl.build(:choice, :text => nil)
      expect(choice).to_not be_valid
    end
    it 'is valid with text' do
      choice = FactoryGirl.build(:choice)
      expect(choice).to be_valid
    end
  end
  describe '#correct?' do
    it 'is a right choice when correct if true' do
      choice = FactoryGirl.build(:choice, correct: true)
      expect(choice.correct).to be true
    end
    it 'is not a right choice when correct if false' do
      choice = FactoryGirl.build(:choice, correct: false)
      expect(choice.correct).to be false
    end
  end
end
