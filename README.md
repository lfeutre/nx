# lfe-nx

[![LFE Versions][lfe badge]][lfe]
[![Erlang Versions][erlang badge]][version]

[![Project Logo][logo]][logo-large]

*Using the Elixir Nx library from LFE*

##### Table of Contents

* [About](#about-)
* [Build](#build-)
* [Usage](#usage-)
* [License](#license-)

## About [&#x219F;](#table-of-contents)

This project aims to allow using the Elixir Nx machine learning library from LFE.

## Build [&#x219F;](#table-of-contents)

You will need to have Erlang, Elixir, and rebar3 installed on your system, in your `PATH`.

``` shell
$ mix local.hex --force
```

```shell
$ rebar3 compile
```

Make sure that you can use Elixir from LFE:

```shell
$ rebar3 lfe repl
```

``` lisp
lfe> (Elixir.IO:puts "Hello, world!")
Hello, world!
ok
```

## Usage [&#x219F;](#table-of-contents)

From the Nx README:

``` lisp
lfe> (set tensor (Elixir.Nx:tensor '((1 2) (3 4))))
```
``` lisp
#M(__struct__ Elixir.Nx.Tensor
   data
     #M(__struct__ Elixir.Nx.BinaryBackend
        state
          #B(1 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 4 0 0 0 ...))
   names (nil nil) shape #(2 2) type #(s 64))
```
``` lisp
lfe> (Elixir.Nx:shape tensor)
```
``` lisp
#(2 2)
```

@rvirding is exploring support for two things that would make working with Elixir easier in LFE:

1. Elixir struct support, and
1. A shortcut for `(Elixir. ...)`

Continuing from the Nx README:

``` lisp
lfe> (Elixir.Nx:divide
       (Elixir.Nx:exp tensor)
       (Elixir.Nx:sum (Elixir.Nx:exp tensor)))
```
``` lisp
#M(__struct__ Elixir.Nx.Tensor
   data
     #M(__struct__ Elixir.Nx.BinaryBackend
        state
          #B(226 79 3 61 185 120 178 61 105 145 114 62 144 215 36 63))
   names (nil nil) shape #(2 2) type #(f 32))
```

For now, doing anything beyond straight-up function calls in Nx is not possible: LFE can't currently utilise Elixir macros (generally true for other BEAM languages, too ... macros tend to be language implementation specific).

## License [&#x219F;](#table-of-contents)

Apache License, Version 2.0

Copyright © 2021, Duncan McGreggor <oubiwann@gmail.com>.

<!-- Named page links below: /-->

[logo]: https://avatars1.githubusercontent.com/u/3434967?s=250
[logo-large]: https://avatars1.githubusercontent.com/u/3434967
[lfe]: https://github.com/rvirding/lfe
[lfe badge]: https://img.shields.io/badge/lfe-1.3.0-blue.svg
[erlang badge]: https://img.shields.io/badge/erlang-19%20to%2023-blue.svg
[version]: https://github.com/lfe/examples/blob/master/lfe-nx/rebar.config
