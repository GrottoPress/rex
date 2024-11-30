require "spec"
require "../src/rex"

struct SomeAdapter
  include Rex::Adapter

  def translate(key : String | Symbol, *args) : String
    translations = {
      named: "Hello, %{name}!",
      unnamed: "Hello, %s!",
      plain: "Hello, World!"
    }

    sprintf(translations[key], *args)
  end

  def translate(key : String | Symbol, **named_args) : String
    translate(key, named_args)
  end

  def localize(value, *args) : String
    value.to_s
  end
end

Rex.configure do |settings|
  settings.adapter = SomeAdapter.new
end
