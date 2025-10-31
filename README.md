# Avo Icons

A lightweight, standalone gem for serving icon SVGs effortlessly in Rails applications. This gem provides access to Heroicons and Tabler Icons with smart caching and configurable search paths.

## Features

- **Multiple Icon Sets**: Includes Heroicons (outline, solid, mini, micro) and Tabler Icons (outline, filled)
- **Smart Caching**: Intelligent caching strategy for optimal performance
- **Configurable Paths**: Pluggable system to add custom SVG search paths
- **Rails-Ready**: Seamlessly integrates with any Rails application
- **Asset Pipeline Support**: Works with Sprockets and Propshaft

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'avo-icons'
```

And then execute:

```bash
bundle install
```

## Usage

### Basic Usage

The `svg` helper is automatically available in all your views:

```erb
<%= svg "heroicons/outline/user" %>
<%= svg "heroicons/solid/heart", class: "w-6 h-6" %>
<%= svg "tabler/outline/home", class: "w-5 h-5 text-gray-500" %>
```

You can omit the `.svg` extension - it will be added automatically:

```erb
<%= svg "heroicons/outline/user" %>
<!-- Same as: -->
<%= svg "heroicons/outline/user.svg" %>
```

### Available Icon Sets

- **Heroicons**:
  - `heroicons/outline/` - Outline style icons
  - `heroicons/solid/` - Solid style icons
  - `heroicons/mini/` - Mini size icons
  - `heroicons/micro/` - Micro size icons

- **Tabler Icons**:
  - `tabler/outline/` - Outline style icons
  - `tabler/filled/` - Filled style icons

### Adding Custom SVG Paths

You can configure additional paths to search for SVG files. Create an initializer:

```ruby
# config/initializers/avo_icons.rb

Avo::Icons.configure do |config|
  # Add a static path
  config.add_path(Rails.root.join("app", "assets", "images", "icons"))
  
  # Add a path from another gem or engine
  config.add_path(MyEngine::Engine.root.join("app", "assets", "svgs"))
  
  # Add a dynamic path using a proc
  config.add_path(->(filename) { 
    Rails.root.join("vendor", "assets", "custom-icons", filename) 
  })
end
```

### Search Order

The gem searches for SVG files in the following order:

1. Asset pipeline (Sprockets/Propshaft)
2. `app/assets/svgs/` in your Rails app
3. Rails root directory
4. Heroicons in avo-icons gem
5. Tabler Icons in avo-icons gem
6. Custom paths (in order of configuration)
7. All Rails asset paths (including engines)

### Passing Options

The `svg` helper accepts all options supported by the [inline_svg](https://github.com/jamesmartin/inline_svg) gem:

```erb
<%= svg "heroicons/outline/user", 
        class: "w-6 h-6", 
        aria: { hidden: true },
        title: "User Profile" %>
```

### Using in Controllers or Models

If you need to use the svg helper outside of views, include the helper module:

```ruby
class MyService
  include Avo::Icons::Helpers
  
  def user_icon
    svg("heroicons/outline/user", class: "w-6 h-6")
  end
end
```

## Configuration

### Custom Configuration

```ruby
Avo::Icons.configure do |config|
  # Add as many custom paths as needed
  config.add_path("/path/to/your/svgs")
  config.add_path(MyEngine::Engine.root.join("assets", "icons"))
  
  # Use procs for dynamic paths
  config.add_path(->(filename) { 
    # Custom logic to find SVGs
    File.join("/custom/path", filename)
  })
end
```

### Resetting Configuration

You can reset the configuration (useful in tests):

```ruby
Avo::Icons.reset_configuration!
```

### Managing the Cache

The SVG cache is stored in `Avo::Icons.cached_svgs` and persists for the application lifecycle. You can manually clear or inspect it if needed:

```ruby
# Clear the cache manually (e.g., after adding new SVG files)
Avo::Icons.cached_svgs = {}

# Check if a file is cached
Avo::Icons.cached_svgs["heroicons/outline/user.svg"]

# In development, you can clear the cache in an initializer to_prepare block
# if you want fresh lookups on each request:
Rails.application.config.to_prepare do
  Avo::Icons.cached_svgs = {}
end
```

## Integration with Other Apps

This gem is designed to work with any Rails application, not just Avo. Simply add it to your Gemfile and start using the `svg` helper in your views.

### Example: Adding to a Rails App

1. Add to Gemfile:
```ruby
gem 'avo-icons'
```

2. Bundle install:
```bash
bundle install
```

3. Use in views:
```erb
<%= svg "heroicons/outline/home", class: "w-5 h-5" %>
```

4. (Optional) Configure custom paths:
```ruby
# config/initializers/avo_icons.rb
Avo::Icons.configure do |config|
  config.add_path(Rails.root.join("app", "assets", "images", "custom-icons"))
end
```

## Performance

The gem uses smart caching to ensure SVG files are only located once per application lifecycle. This means:

- **First Request**: File is located and cached
- **Subsequent Requests**: Cached path is used (no file system lookup)
- **Production**: Cache persists for optimal performance
- **Development**: Cache persists by default. If you need fresh lookups (e.g., when adding new SVG files), manually clear the cache or configure a `to_prepare` hook

## Contributing

Bug reports and pull requests are welcome on GitHub.

## License

See LICENSE.md
