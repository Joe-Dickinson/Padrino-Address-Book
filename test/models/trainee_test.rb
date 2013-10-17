require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class TraineeTest < Test::Unit::TestCase
  context "Trainee Model" do
    should 'construct new instance' do
      @trainee = Trainee.new
      assert_not_nil @trainee
    end
  end
end
