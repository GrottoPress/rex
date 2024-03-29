require "habitat"

require "./rex/version"
require "./rex/**"

module Rex
  Habitat.create do
    setting adapter : Rex::Adapter
  end

  def self.t(key, *args, **named_args)
    Rex.settings.adapter.translate(key, *args, **named_args)
  end

  def self.l(value, *args, **named_args)
    Rex.settings.adapter.localize(value, *args, **named_args)
  end
end
