-- aider
--
-- Cursor-like ML / AI interface
--
-- https://aider.chat
-- https://github.com/Aider-AI/aider
-- https://github.com/joshuavial/aider.nvim

local lcl_opts = {
  "joshuavial/aider.nvim",
  config = function()
    require('aider').setup({
      auto_manage_context = false,
      default_bindings = false
    })
  end
}


return lcl_opts
