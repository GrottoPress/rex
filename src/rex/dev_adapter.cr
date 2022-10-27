struct Rex::DevAdapter
  include Rex::Adapter

  def translate(key, *args, **named_args) : String
    key.to_s
  end

  def localize(value, *args, **named_args) : String
    value.to_s
  end
end
