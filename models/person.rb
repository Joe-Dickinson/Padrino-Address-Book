class Person
  include MongoMapper::Document

  # key <name>, <type>
  key :first_name, String
  key :last_name, String
  key :email, String
  key :github, String
  key :twitter, String
  timestamps!
end
