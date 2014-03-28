require 'active_record'
require 'logger'

ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"])
ActiveRecord::Base.logger = Logger.new(STDOUT)
