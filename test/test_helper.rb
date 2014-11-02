<<<<<<< HEAD
begin
  require_relative 'env'
rescue LoadError
end

require 'minitest/autorun'

require 'active_record'
require 'logger'

ActiveRecord::Base.establish_connection(:adapter => ENV["ADAPTER"], :database => ENV["DATABASE"], :username => ENV["USERNAME"], :password => ENV["PASSWORD"], :host => ENV["HOST"])
ActiveRecord::Base.logger = Logger.new(STDERR)
=======
begin
  require_relative 'env'
rescue LoadError
end
require 'minitest/unit'
require 'minitest/autorun'

require 'active_record'
require 'logger'

ActiveRecord::Base.establish_connection(:adapter => ENV["ADAPTER"], :database => ENV["DATABASE"], :username => ENV["USERNAME"], :password => ENV["PASSWORD"], :host => ENV["HOST"])
ActiveRecord::Base.logger = Logger.new(STDERR)
>>>>>>> c18d6aa0316fffec063e8484590e00b96fcb5f75
ActiveRecord::Base.connection