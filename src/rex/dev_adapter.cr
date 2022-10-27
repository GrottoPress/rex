struct Rex::DevAdapter
  include Rex::Adapter

  def translate(text, *args, **named_args) : String
    text.to_s
  end

  def localize(value, *args, **named_args) : String
    value.to_s
  end
end
