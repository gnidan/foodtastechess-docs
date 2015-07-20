map '/' do
    use Rack::Static,
        :urls => [""], :root => File.expand_path('_build/html'), :index => 'index.html'
    run lambda {|*|}
end
