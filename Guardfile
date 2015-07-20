interactor :coolline
notification :off

guard 'rack', :port => 5500 do
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
