begin
  require './env'
rescue LoadError
end
require 'active_record'
require 'logger'

ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"])
ActiveRecord::Base.logger = Logger.new(STDOUT)

# Models
require_relative 'models/user'
require_relative 'models/tenshi'
require_relative 'models/relationship'

ActiveRecord::Base.connection