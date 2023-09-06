require_relative '../classes/teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new(1, 'Genetics', 57, 'Frank Mendez')
  end

  describe "#new" do
    it "should be able to be created" do
      expect(@teacher).to be_instance_of(Teacher)
    end

    it "should save the id of the new teacher" do
      expect(@teacher.id).to eq(1)
    end

    it "should save the specialization of the new teacher" do
      expect(@teacher.specialization).to eq("Genetics")
    end

    it "should save the age of the new teacher" do
      expect(@teacher.age).to eq(57)
    end

    it "should save the name of the new teacher" do
      expect(@teacher.name).to eq("Frank Mendez")
    end
  end
end
