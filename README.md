# Avo::Icons

`avo-icons` was built as a dependency for [Avo](https://avohq.io/), is a Ruby gem designed to seamlessly integrate [Heroicons](https://heroicons.com/) and [Tabler Icons](https://tabler.io/icons) SVGs into [Avo](https://avohq.io/).

## Usage

### Heroicons

Prepend the `heroicons` namespace and then the variant `outline`, `solid`, `mini`, or `micro` and then the icon name.

```erb
<%= svg "heroicons/outline/academic-cap.svg" %>
```

```ruby
# in the menu builder
# config/initializers/avo.rb
Avo.configure do |config|
  config.main_menu = -> {
    section "Store", icon: "heroicons/outline/academic-cap" do
      resource Avo::Resources::Store
    end
  end
end
```

### Tabler Icons

Prepend the `tabler` namespace and then the variant `outline` or `filled` and then the icon name.

```erb
<%= svg "tabler/outline/settings.svg" %>
```

```ruby
# in the menu builder
# config/initializers/avo.rb
Avo.configure do |config|
  config.main_menu = -> {
    section "Settings", icon: "tabler/outline/settings" do
      resource Avo::Resources::Setting
    end
  end
end
```
