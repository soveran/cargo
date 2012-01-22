require "./lib/cargo"

Gem::Specification.new do |s|
  s.name              = "cargo"
  s.version           = Cargo::VERSION
  s.summary           = "Require libraries without cluttering your namespace."
  s.description       = "Cargo lets you use different versions of the same library by implementing two simple commands, which let you load programs without messing with your namespace."
  s.authors           = ["Michel Martens", "Damian Janowski"]
  s.email             = ["michel@soveran.com", "djanowski@dimaion.com"]
  s.homepage          = "http://github.com/soveran/cargo"
  s.files             = Dir[ "LICENSE", "README.markdown", "Rakefile", "lib/**/*.rb", "*.gemspec", "test/*.*" ]
  s.add_development_dependency "cutest"
end
