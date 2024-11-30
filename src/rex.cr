require "./rex/version"
require "./rex/**"

module Rex
  private module Settings
    class_property! adapter : Rex::Adapter
  end

  extend self

  def settings
    Settings
  end

  def configure : Nil
    yield settings
  end

  def t(key, *args, **named_args)
    Rex.settings.adapter.translate(key, *args, **named_args)
  end

  def l(value, *args, **named_args)
    Rex.settings.adapter.localize(value, *args, **named_args)
  end
end
