require 'rack-livereload'

PORT = ENV['RELOAD_PORT'] || 35729

map '/' do
    use Rack::LiveReload,
        :live_reload_port => PORT

    use Rack::Static,
        :urls => [""], :root => File.expand_path('_build/html'), :index => 'index.html'

    run lambda {|*|}
end
