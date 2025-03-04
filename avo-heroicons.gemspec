require_relative "lib/avo/heroicons/version"

Gem::Specification.new do |spec|
  spec.name        = "avo-heroicons"
  spec.version     = Avo::Heroicons::VERSION
  spec.authors     = [ "Paul Bob", "Adrian Marin" ]
  spec.email       = [ "avo@avohq.io" ]
  spec.homepage    = "https://avohq.io"
  spec.summary     = "A lightweight Avo dependency for serving Heroicons SVGs effortlessly."
  spec.description = "A lightweight Avo dependency for serving Heroicons SVGs effortlessly."

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]
  end
end
