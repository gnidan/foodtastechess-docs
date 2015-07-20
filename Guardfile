notification :off

PORT = ENV['PORT'] || 5500

guard 'rack', :port => PORT do
  watch /_build\/html\/.*/
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
