notification :off

PORT = ENV['PORT'] || 5500
RELOAD_PORT = ENV['RELOAD_PORT'] || 35729


guard 'rack', :port => PORT do
  watch 'config.ru'
end


guard :shell do
  watch /.*\.rst/ do |m|
    msg_begin = "#{m[0]} changed, rebuilding..."
    n msg_begin, 'Sphinx'

    `make html`
    `make latexpdf`

    msg_success = "#{m[0]} changed, rebuilt."
    n msg_success, 'Sphinx'
    "-> #{msg}"
  end
end

`make html`

guard 'livereload', :port => RELOAD_PORT do
  watch /_build\/html\/.+\.(css|js|html|png)/
end
