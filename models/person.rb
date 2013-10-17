class Person
  include MongoMapper::Document

  # key <name>, <type>
  key :first_name, String
  key :last_name, String
  key :email, String
  key :github, String
  key :twitter, String
  timestamps!


  def self.find_by_letter(letter)
    search = "^[#{letter.downcase}#{letter.upcase}]"
    Person.where(:last_name => Regexp.new(/#{search}/)).all
    # person.where(:last_name => letter, )
    # Person.where(:last_name.gte => letter, :last_name.lt => letter.next )
  end
end