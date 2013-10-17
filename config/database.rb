MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)

case Padrino.env
  when :development then MongoMapper.database = 'padrino_address_book_development'
  when :production  then MongoMapper.database = 'padrino_address_book_production'
  when :test        then MongoMapper.database = 'padrino_address_book_test'
end
