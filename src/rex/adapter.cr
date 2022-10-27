module Rex::Adapter
  macro included
    def translate(key, *args, **named_args) : String
    end

    def localize(value, *args, **named_args) : String
    end
  end
end
