module Cargo
  VERSION = "0.0.1"

  def self.import(file)
    unless file.match(/\.rb$/)
      file = "#{file}.rb"
    end

    load(file, true)

    @cargo
  end

  def self.export(cargo)
    @cargo = cargo
  end
end

def import(file)
  Cargo.import(file)
end

def export(cargo)
  Cargo.export(cargo)
end
