require "./tenshitter_app"

use Rack::Static, :root => "public", :urls => ["/js", "/css", "/fonts", "/images"]
run lambda { |env|
  [200, {'Content-Type'  => 'text/html', 'Cache-Control' => 'public, max-age=86400'}, File.open('views/index.html','views/form.html','views/index_error.html','views/timeline.html', File::RDONLY)]
}

run TenshitterApp.new