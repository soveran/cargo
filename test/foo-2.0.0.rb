class Foo
  class Bar
    class Baz
      def qux
        "Hello"
      end
    end

    def baz
      "Hello"
    end
  end

  def bar
    "Hello"
  end
end

export(Foo) if defined?(export)
