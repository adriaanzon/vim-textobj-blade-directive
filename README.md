vim-textobj-blade-directive
===========================

A text object for Laravel's [Blade](https://laravel.com/docs/master/blade)
directives.

![Example](https://raw.githubusercontent.com/adriaanzon/assets/master/vim-textobj-blade-directive.gif)

Depends on [vim-textobj-user](https://github.com/kana/vim-textobj-user) and
[vim-blade](https://github.com/jwalton512/vim-blade).

Also requires the matchit.vim plugin to be enabled. Ensure that the following
line is included somewhere in your vimrc file:

```vim
runtime macros/matchit.vim
```

Usage
-----

When textobj-blade-directive is installed you will gain two new text objects,
which are triggered by `ad` and `id` respectively. These follow Vim convention,
so that `ad` selects _all_ of a Blade directive, and `id` selects the _inner_
portion of a Blade directive.

### Tips

In the example GIF, the `@if` statement got surrounded with a `@can` statement.
This isn't directly related to this plugin, but it was achieved using the
[vim-surround](https://github.com/tpope/vim-surround) plugin, with the following
configuration in `after/ftplugin/blade.vim`:

```vim
" Use 'd' to surround with a Blade directive.
let b:surround_{char2nr("d")} = "@\1Blade directive: @\1 \r @end\1\r\[( \]\\+.*\r\1"
" Some aliases for convenience.
let b:surround_{char2nr("D")} = b:surround_{char2nr("d")}
let b:surround_{char2nr("@")} = b:surround_{char2nr("d")}
```

Now you can surround anything with a Blade directive. For example, if you wanted
to surround a paragraph, you could select the paragraph with `vip`, followed by
an `S` to activate vim-surround, followed by a `d`. This will open a prompt
where you may type your blade directive.

### Limitations

Operations are done line wise, so this text object doesn't work for statements
on a single line.

Some text objects in Vim respond to a count. For example, the `a{` text object
will select _all_ of the current `{}` delimited block, but if you prefix it with
the number 2 (e.g. `v2i{`) then it will select all of the block that contains
the current block. The Blade directive text object does not respond in this way
if you prefix a count. This is due to a limitation in the [textobj-user
plugin](https://github.com/kana/vim-textobj-user).

However, you can achieve a similar effect by repeating the Blade directive
text-object manually. So if you press `vad` to select the current Blade
directive, you can expand your selection outwards by repeating `ad`, or contract
your selection inwards by repeating `id`.

Credits
-------

Thanks to Drew Neil for his plugin
[vim-textobj-rubyblock](https://github.com/nelstrom/vim-textobj-rubyblock). This
plugin was made by simply changing the search patterns in his plugin.

I also thank Kana Natsuno for providing
[a framework](https://github.com/kana/vim-textobj-user) to build custom text
objects.

License
-------

Copyright (c) Adriaan Zonnenberg. Distributed under the same terms as Vim
itself. See `:help license`.
