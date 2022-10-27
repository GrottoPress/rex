require "spec"
require "../src/rex"

private struct SomeAdapter
  include Rex::Adapter

  def translate(text : String | Symbol, *args) : String
    translations = {
      named: "Hello, %{name}!",
      unnamed: "Hello, %s!",
      plain: "Hello, World!"
    }

    sprintf(translations[text], *args)
  end

  def translate(text : String | Symbol, **named_args) : String
    translate(text, named_args)
  end

  def localize(value, *args) : String
    value.to_s
  end
end

Rex.configure do |settings|
  settings.adapter = SomeAdapter.new
end

Habitat.raise_if_missing_settings!
