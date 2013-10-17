require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class PersonTest < Test::Unit::TestCase
  context "Person Model" do
    should 'construct new instance' do
      @person = Person.new
      assert_not_nil @person
    end
  end
end
