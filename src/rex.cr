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
end
