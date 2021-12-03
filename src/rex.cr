require "habitat"

require "./rex/version"
require "./rex/**"

module Rex
  Habitat.create do
    setting adapter : Rex::Adapter
  end

  def self.t(text, *args, **named_args)
    Rex.settings.adapter.translate(text, *args, **named_args)
  end

  def self.l(value, *args)
    Rex.settings.adapter.localize(value, *args)
  end
end
