module Rex::Adapter
  macro included
    def translate(text : String | Symbol, *args) : String
    end

    def translate(text : String | Symbol, **named_args) : String
      translate(text, named_args)
    end
  end
end
