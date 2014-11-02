<<<<<<< HEAD
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

=======
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

>>>>>>> c18d6aa0316fffec063e8484590e00b96fcb5f75
ActiveRecord::Base.connection