task :test do
  system "cd test && ruby cargo_test.rb"
  exit $?.exitstatus
end

task :default => :test
