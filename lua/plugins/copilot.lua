return {
    {
        "github/copilot.vim",
        event = "InsertEnter",
        autoStart = true,
        run = function()
            require("copilot").start()
        end,
        config = function()
            vim.api.nvim_set_keymap("i", "<C-.>", "<cmd>lua require('copilot').complete()<CR>", { noremap = true, silent = true }) 
        end,
        
    },
}
