module Avo
  module Icons
    class Railtie < ::Rails::Railtie
      initializer "avo-icons.helpers" do
        ActiveSupport.on_load(:action_view) do
          include Avo::Icons::Helpers
        end
      end
    end
  end
end
