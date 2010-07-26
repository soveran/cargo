Cargo
=====

Require libraries without cluttering your namespace.

Description
-----------

Consider these two versions of the same library:

    # foo-1.0.0.rb
    class Foo
      VERSION = "1.0.0"
    end

    # foo-2.0.0.rb
    class Foo
      VERSION = "2.0.0"
    end

If you want to use both of them in your application, `require` and
`load` will be of little help. Consider what happens when you require
both libraries:

    >> require "foo-1.0.0"
    => true
    >> require "foo-2.0.0"
    => true
    >> Foo::VERSION
    => "2.0.0"

As both files are opening the same class, there's no way for you to use
them independently.

Cargo solves that problem in a very simple way:

    >> Foo1 = import("foo-1.0.0")
    => #<Module:0x000001009ffa28>::Foo
    >> Foo2 = import("foo-2.0.0")
    => #<Module:0x000001009f2828>::Foo
    >> Foo1::VERSION
    => "1.0.0"
    >> Foo2::VERSION
    => "2.0.0"

How does it work?
-----------------

The command `Kernel.load` accepts a second parameter, which value is
`false` by default. When the passed value is `true`, the script is
executed under an anonymous module, protecting the calling program's
global namespace. No local variables in the loaded file are propagated
to the loading environment.

By using a global module as a temporal storage, it is possible to
transfer a value from the anonymous module to the caller program.

Usage
-----

After requiring `cargo` in the calling program, two methods will
be available: `import` and `export`. Both use the global module
`Cargo` for temporal storage.

This is how you will use it in the calling program:

    $ cat calling_program.rb
    require "cargo"

    MyFoo = import("foo")


And for that to work, the imported library should look like this:

    $ cat foo.rb
    class Foo
      VERSION = "1.0.0"
    end

    export(Foo)

Note that you can only export one value per file. Multiple calls to
`export` just change the value to be exported. This constraint is in
place in order to make for a simple and clean implementation.

How to prepare your library for Cargo
-------------------------------------

In your library entry point, you need to use `export` and provide a value. As
the `export` method won't be available unless the caller is using
Cargo, you can make a conditional call:

    export(Foo) if defined?(export)

If your library has just one file, that single line will make your code
ready to be imported. Otherwise, you will need to require Cargo and
make sure you don't mix import with require for local files.

Installation
------------

    $ gem install cargo

License
-------

Copyright (c) 2010 Michel Martens & Damian Janowski

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
