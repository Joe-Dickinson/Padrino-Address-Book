class Trainee < Person
  include MongoMapper::Document

  # key <name>, <type>
  key :favourite_editor, String
  key :iq, Integer
  timestamps!
end
