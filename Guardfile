notification :off

PORT = ENV['PORT'] || 5500
RELOAD_PORT = ENV['RELOAD_PORT'] || 35729

guard 'rack', :port => PORT do
  watch 'config.ru'
end

guard :shell do
  watch /.*\.rst/ do |m|
    `make html`

    msg = "#{m[0]} changed, rebuilt HTML."
    n msg, 'Sphinx'
    "-> #{msg}"
  end
end

guard 'livereload', :port => RELOAD_PORT do
  watch /_build\/html\/.+\.(css|js|html|png)/
end

guard :shell do
  watch /.*\.rst/ do |m|
    `make latexpdf`

    msg = "#{m[0]} changed, rebuilt PDF."
    n msg, 'Sphinx'
    "-> #{msg}"
  end
end

`make html`
`make latexpdf`

