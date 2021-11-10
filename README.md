# interestingwords.nvim

Provides cursor word high-highlight and cursor word navigation.

Usage:

```vim
" Hightlight or cancel hightlight the cursor word
Interestingwords --toggle
" Remove all the hightlight created by interestingwords.nvim
Interestingwords --remove_all
" A wrapper of search() of vimscript, b means backward.
" Thus it not limited to the hightlighted word
Interestingwords --navigate [b]
```

Configuration (lua):

```lua
vim.g.interestingwords_colors =
    {'#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF'}
```

## Inspiration

[vim-interestingwords](https://github.com/lfv89/vim-interestingwords)
