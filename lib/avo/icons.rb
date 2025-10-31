require "avo/icons/version"
require "avo/icons/railtie"

module Avo
  module Icons
    def self.root
      Pathname.new File.expand_path('..', __dir__)
    end
  end
end
