# minimalistic-python.vim

A minimal **dark** Neovim colorscheme: a pure-black background, white symbols,
and a tiny accent set. A sibling of
[pustota.nvim](https://github.com/drlinggg/pustota.nvim) (its light counterpart).
Tuned for Python (Treesitter + pyright via coc.nvim), but the standard
highlight groups make it work everywhere.

## Palette

| Role                                    | Color     |
| --------------------------------------- | --------- |
| Background                              | `#000000` |
| Symbols / variables / operators / builtins | `#f0f0f0` |
| Comments / punctuation / line numbers   | `#6e757f` |
| Strings                                 | `#f15b5b` |
| Numbers / `None` / `True` / `False`     | `#f48fb8` |
| Keywords / decorators                   | `#7fb86a` |
| Function / class / type names           | `#5fc99e` |

One warm pair (red + pink) balanced by one cool green pair — no blue, no yellow.

## Install

**vim-plug:**

```vim
Plug 'drlinggg/minimalistic-python.vim'

colorscheme minimalistic-python
```

Then run `:PlugInstall`.

**lazy.nvim:**

```lua
{ "drlinggg/minimalistic-python.vim", lazy = false, priority = 1000,
  config = function() vim.cmd.colorscheme("minimalistic-python") end }
```

**packer.nvim:**

```lua
use "drlinggg/minimalistic-python.vim"
```

Requires a true-color terminal (`set termguicolors`).
