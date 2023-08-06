local config = {
    ui = {
        default = "float",
        float = {
            border = { " ", " ", " ", " ", " ", " ", " ", " " },
            float_hl = "Normal",
            border_hl = "FloatBorder",
            blend = 0,
            height = 1,
            width = 1,
            x = 0,
            y = 1,
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
        FORGIT_FZF_DEFAULT_OPTS = "--height='100%' --preview-window='right:50%' --reverse --color='fg:#448589,bg:#1B2125,hl:#C94233,fg+:#448589,bg+:#1B2125,hl+:#C94233,pointer:#C94233,info:#E58C26,spinner:#E58C26,header:#C94233,prompt:#7F9858,marker:#C94233'",
        COLORS = "fg:#448589,bg:#1B2125,hl:#C94233,fg+:#448589,bg+:#1B2125,hl+:#C94233,pointer:#C94233,info:#E58C26,spinner:#E58C26,header:#C94233,prompt:#7F9858,marker:#C94233",
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

local M = {}

M.init = function(cmd)
    local lvim_shell = require("lvim-shell")
    if config.ui.default == "split" then
        lvim_shell.split(cmd, "<CR>", config)
    else
        lvim_shell.float(cmd, "<CR>", config)
    end
end

M.commands = function()
    local exe_file = vim.fn.fnamemodify(debug.getinfo(1, "S").source:gsub("^@", ""), ":h:h") .. "/bin/LvimForgit"
    vim.api.nvim_create_user_command("LvimForgit", function()
        M.init(exe_file)
    end, {})
    vim.api.nvim_create_user_command("LvimForgitAdd", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit add")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitBlame", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit blame")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitBranchDelete", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit branch_delete")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitCheckoutBranch", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit checkout_branch")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitCheckoutCommit", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit checkout_commit")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitCheckoutFile", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit checkout_file")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitCheckoutTag", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit checkout_tag")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitCherryPick", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit cherry_pick")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitCherryPickFromBranch", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit cherry_pick_from_branch")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitClean", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit clean")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitDiff", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit diff")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitFixUp", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit fixup")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitIgnore", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit ignore")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitLog", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit log")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitRebase", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit rebase")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitResetHead", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit reset_head")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitRevertCommit", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit revert_commit")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitStashShow", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit stash_show")
    end, {})
    vim.api.nvim_create_user_command("LvimForgitStashPush", function()
        M.init(config.env.FORGIT_PATH .. "/git-forgit stash_push")
    end, {})
end

M.setup = function(user_config)
    if user_config ~= nil then
        config = vim.tbl_deep_extend("force", config, user_config)
    end
    M.commands()
end

return M
