struct Rex::DevAdapter
  include Rex::Adapter

  def translate(text : String | Symbol, *args) : String
    text.to_s
  end
end
