# LVIM FORGIT - Forgit for Neovim

![lvim-logo](https://user-images.githubusercontent.com/82431193/115121988-3bc06800-9fbe-11eb-8dab-19f624aa7b93.png)

[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://github.com/lvim-tech/lvim-colorscheme/blob/main/LICENSE)

## Requirements

-   [LVIM SHELL](https://github.com/lvim-tech/lvim-shell)
-   [FORGIT](https://github.com/wfxr/forgit)
-   fzf

## Installation

Install the plugin with your preferred package manager:

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
require("lazy").setup({
  {
    "lvim-tech/lvim-forgit",
    dependencies = { "lvim-tech/lvim-shell" },
    config = function()
      require("lvim-forgit").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
})
```

### [packer](https://github.com/wbthomason/packer.nvim)

```lua
use({
  "lvim-tech/lvim-forgit",
  requires = { "lvim-tech/lvim-shell" },
  config = function()
    require("lvim-forgit").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    })
  end,
})
```

## Default configuration

```lua
{
  ui = {
    default = "float",
    float = {
      border = { " ", " ", " ", " ", " ", " ", " ", " " },
      float_hl = "Normal",
      border_hl = "FloatBorder",
      blend = 0,
      height = 1,
      width = 1,
      x = 0.5,
      y = 0.5,
    },
    split = "rightbelow new", -- `leftabove new`, `rightbelow new`, `leftabove vnew 24`, `rightbelow vnew 24`
  },
  on_close = {},
  on_open = {},
  mappings = {
    close = "<C-q>",
  },
  env = {
    FORGIT_PATH = vim.fn.fnamemodify(debug.getinfo(1, "S").source:gsub("^@", ""), ":h:h") .. "/forgit/bin",
    FORGIT_FZF_DEFAULT_OPTS = "--height='100%' --preview-window='right:50%'",
    REVERSE = "--reverse",
    ICON_MENU = "",
    ICON_POINTER = "",
    ICON_MARKER = "",
    ICON_PROMPT = "",
    ICON_SEPARATOR = "",
    KEY_QUIT = "ctrl-q",
    KEY_CLEAR_QUERY = "ctrl-c",
  },
}
```

## Command

```lua
:LvimForgit
:LvimForgitAdd
:LvimForgitBlame
:LvimForgitBranchDelete
:LvimForgitCheckoutBranch
:LvimForgitCheckoutCommit
:LvimForgitCheckoutFile
:LvimForgitCheckoutTag
:LvimForgitCherryPick
:LvimForgitCherryPickFromBranch
:LvimForgitClean
:LvimForgitDiff
:LvimForgitFixUp
:LvimForgitIgnore
:LvimForgitLog
:LvimForgitRebase
:LvimForgitResetHead
:LvimForgitRevertCommit
:LvimForgitStashShow
:LvimForgitStashPush
```
