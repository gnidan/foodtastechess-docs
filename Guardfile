notification :off

PORT = ENV['PORT'] || 5500
RELOAD_PORT = ENV['RELOAD_PORT'] || 35729


guard 'rack', :port => PORT do
  watch 'config.ru'
end


guard :shell do
  watch /.*\.rst/ do |m|
    `make html`

    msg = "#{m[0]} changed, rebuilt."
    n msg, 'Sphinx'
    "-> #{msg}"
  end
end

`make html`

guard 'livereload', :port => RELOAD_PORT do
  watch /_build\/html\/.+\.(css|js|html|png)/
end
