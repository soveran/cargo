Gem::Specification.new do |s|
  s.name              = "cargo"
  s.version           = "0.0.1"
  s.summary           = "Require libraries without cluttering your namespace."
  s.description       = "Cargo lets you use different versions of the same library by implementing two simple commands, which let you load programs without messing with your namespace."
  s.authors           = ["Michel Martens", "Damian Janowski"]
  s.email             = ["michel@soveran.com", "djanowski@dimaion.com"]
  s.homepage          = "http://github.com/soveran/cargo"
  s.files = ["LICENSE", "README.markdown", "Rakefile", "lib/cargo.rb", "cargo.gemspec", "test/cargo_test.rb", "test/foo-1.0.0.rb", "test/foo-2.0.0.rb", "test/helper.rb"]
end
