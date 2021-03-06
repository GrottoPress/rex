struct Rex::DevAdapter
  include Rex::Adapter

  def translate(text : String | Symbol, *args) : String
    text.to_s
  end

  def localize(value, *args) : String
    value.to_s
  end

  def localize(value, **named_args) : String
    value.to_s
  end
end
