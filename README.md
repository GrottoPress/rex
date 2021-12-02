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

1. Define a default adapter for your shard:

   ```crystal
   struct SomeShardI18nAdapter
     include Rex::Adapter

     def translate(text : String | Symbol, *args) : String
       translations = {
         named: "Hello, %{name}!",
         unnamed: "Hello, %s!",
         plain: "Hello, World!"
       }

       sprintf(translations[text], *args)
     end
   end
   ```

1. Configure *Rex* to use this default adapter:

   ```crystal
   Rex.configure do |settings|
     settings.adapter = SomeShardI18nAdapter.new
   end
   ```

1. Call the *i18n* helpers in your shard as required:

   ```crystal
   Rex.t(:named, name: "Ama")

   Rex.t(:named, {name: "John"})

   Rex.t(:unnamed, "Judith")

   Rex.t(:plain)
   ```

1. The consumer application defines their adapter:

   ```crystal
   # ->>> src/config/i18n.cr

   require "some_i18n_shard"

   struct SomeAppI18nAdapter
     include Rex::Adapter

     def translate(text : String | Symbol, *args) : String
       # You may use any i18n shard as backend
       Somei18nShard.t(text, *args)
     end
   end
   ```

1. The consumer application may then replace your default adapter:

   ```crystal
   # ->>> src/config/i18n.cr

   Rex.configure do |settings|
     settings.adapter = SomeAppI18nAdapter.new
   end
   ```

   The consumer application sets up translations according whatever backend they are using.

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
