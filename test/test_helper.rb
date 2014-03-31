begin
  require './env'
rescue LoadError
end
require 'minitest/unit'
require 'minitest/autorun'

require 'active_record'

ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"])
ActiveRecord::Base.connection
