# encoding: UTF-8

require File.join(File.dirname(__FILE__), "..", "lib", "cargo")

AssertionFailed = Class.new(StandardError)

def assert(value)
  return if value

  file, line = caller[0].split(":")
  code = File.readlines(file)[line.to_i - 1]

  puts " ✗ #{code.strip}"
  puts "   #{file}:#{line}"
  exit(1)
end

def setup(&block)
  @_setup = block
end

def test(name = nil, &block)
  @_test = name

  block.call(@_setup.call)
end
