MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)

case Padrino.env
  when :development then MongoMapper.database = 'me_development'
  when :production  then MongoMapper.database = 'me_production'
  when :test        then MongoMapper.database = 'me_test'
end