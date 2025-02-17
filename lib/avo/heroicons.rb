require "avo/heroicons/version"
require "avo/heroicons/railtie"

module Avo
  module Heroicons
    def self.root
      Pathname.new File.expand_path('..', __dir__)
    end
  end
end
