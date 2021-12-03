# Rex

**Rex** is a simple *i18n* adapter interface for *Crystal*. It allows a shard to define translatable text, enabling apps that `require` the shard to use any *i18n* shard of choice as backend.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     rex:
       github: GrottoPress/rex
   ```

1. Run `shards update`

1. Require *Rex*:

   ```crystal
   # ...
   require "rex"
   # ...
   ```

## Usage

1. Call the *i18n* helpers in your shard as required:

   ```crystal
   # Translation
   Rex.t(:some_text, name: "Ama")
   Rex.t("some_text", {name: "John"})
   Rex.t("some.text", 45, "Judith")
   Rex.t(:another_text)

   # Localization
   Rex.l(Time.utc)
   Rex.l(123_456, :arg)
   ```

1. The consumer application defines their adapter:

   ```crystal
   # ->>> src/config/i18n.cr

   require "some_i18n_shard"

   struct SomeAppI18nAdapter
     include Rex::Adapter

     def translate(text : String | Symbol, *args) : String
       # You may use any i18n shard as backend
       Somei18nShard.translate(text, *args)
     end

     def localize(value, *args) : String
       # You may use any i18n shard as backend
       Somei18nShard.localize(value, *args)
     end
   end
   ```

1. The consumer application then configures *Rex* to use this adapter:

   ```crystal
   # ->>> src/config/i18n.cr

   Rex.configure do |settings|
     settings.adapter = SomeAppI18nAdapter.new
   end
   ```

   The consumer application sets up translations according whatever backend they are using.

### Testing

*Rex* comes with `Rex::DevAdapter` which may be used for tests:

```crystal
# ->>> spec/my_app/some_spec.cr

Rex.temp_config(adapter: Rex::DevAdapter.new) do
  # ...
  # `Rex::DevAdapter` returns the text passed to `Rex.t` unchanged
  Rex.t(:some_text, {name: "Kwame"}).should(eq "some_text")
  # ...
end
```

## Development

Run tests with `crystal spec`.

## Contributing

1. [Fork it](https://github.com/GrottoPress/rex/fork)
1. Switch to the `master` branch: `git checkout master`
1. Create your feature branch: `git checkout -b my-new-feature`
1. Make your changes, updating changelog and documentation as appropriate.
1. Commit your changes: `git commit`
1. Push to the branch: `git push origin my-new-feature`
1. Submit a new *Pull Request* against the `GrottoPress:master` branch.
