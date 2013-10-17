class Person
  include MongoMapper::Document

  # key <name>, <type>
  key :type, String
  key :last_name, String
  #last_name
  key :email, String
  key :github, String
  key :twitter, String
  timestamps!
end
