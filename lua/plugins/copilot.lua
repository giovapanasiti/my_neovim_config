return {
    {
        "github/copilot.vim",
        event = "VimEnter",
        autoStart = true,
        run = function()
            require("copilot").start()
        end,
        config = function()
             vim.g.copilot_no_tab_map = true
             vim.api.nvim_set_keymap("i", "<C-v>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
        end,
        
    },
}
