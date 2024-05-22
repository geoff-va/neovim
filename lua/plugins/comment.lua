return {
    'numToStr/Comment.nvim',
    opts = {
        toggler = {
            ---Line-comment toggle keymap
            line = '<Leader>c<Space>',
            ---Block-comment toggle keymap
            block = '<Leader>b<Space>',
        },
        extra = {
            ---Add comment on the line above
            above = '<Leader>cO',
            ---Add comment on the line below
            below = '<Leader>co',
            ---Add comment at the end of line
            eol = '<Leader>cA',
    },
        -- add any options here
    },
    lazy = false,
}
