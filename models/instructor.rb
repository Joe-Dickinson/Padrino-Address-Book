class Instructor < Person
  include MongoMapper::Document

  # key <name>, <type>
  key :years_teaching_experience, String
  timestamps!
end
