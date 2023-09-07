require_relative '../classes/nameable'

describe Nameable do
  before :each do
    @nameable = Nameable.new
  end

  describe '#new' do
    it 'should create a new Nameable object' do
      expect(@nameable).to be_instance_of(Nameable)
    end
  end

  context 'correct_name method' do
    it "should return a message: 'NotImplementedError: correct_name is not implemented' when the name is not set" do
      expect { @nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
