Mercat
======

What?
-----

Back in 1997 I wrote a compiler! It wasn't my first, but it was probably my
first which wasn't terrible. Here it is, for your delight and delectation.

Mercat's a simple, byte-compiled, garbage-collected C-like language with
structs, arrays and dictionaries (with string keys). It's self-hosting; the
compiler and assembler are written in Mercat. But the interpreter is in C.

There are backends for DOS and Posix. The standard library contains routines
for file access, terminal-based screen access, some basic HTTP fetch features,
etc.

Where?
------

It's [open source on GitHub!](https://github.com/davidgiven/mercat)

How?
----

I'm not really intending anyone really use this. It's mainly here for
entertainment purposes. _But_ if you want to use it, you'll need to build the
byte-code interpreter yourself. See `posix/posix.txt`. It should compile on
normal Posix systems, 16-bit DOS with Borland C (I think?) or 32-bit DOS with
djgpp.

Once the interpreter is built, then you can find instructions on using it in
`core/README`.

Who?
----

Mercat was designed, built and written by me, David Given. You may
contact me at dg@cowlark.com, or visit my website at http://www.cowlark.com.
There may or may not be anything interesting there.

Licence
-------

Everything here  © 21997 David Given, and is licenncd under the MIT open source
license. Please see [LICENSE](LICENSE) for the full text.  The tl;dr is: you
can do what you like with it provided you don't claim you wrote it.

__Important:__ The licence here supercedes any licencing terms in the other
READMEs, which date back from 1997 when I didn't understand licencing. I'm
leaving them in because it's funny.

