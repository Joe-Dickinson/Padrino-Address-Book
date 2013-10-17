require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class InstructorTest < Test::Unit::TestCase
  context "Instructor Model" do
    should 'construct new instance' do
      @instructor = Instructor.new
      assert_not_nil @instructor
    end
  end
end
