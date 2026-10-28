-- ccc.nvim
--
-- Color Picker
--
-- https://github.com/uga-rosa/ccc.nvim
--
-- test - move the cursor over these colors, then `:CccPick`
-- (note: hotkey "\c" runs :CccPick)
--
-- "#aaa"
-- "#aaabbb"
--  --color-base-content: oklch(97.807% 0.029 256.847);

local opts = {
  'uga-rosa/ccc.nvim',
  -- Note: user commands (:CccPick, :CccConvert, :CccHighlighter*) are only
  -- created by require('ccc').setup(), so a config/opts entry is required.
  config = function()
    local ccc = require('ccc')
    local input = ccc.input
    local output = ccc.output
    ccc.setup({
      -- inputs/outputs must include a format for `recognize` to use it
      inputs = {
        input.rgb,
        input.hsl,
        input.oklch,
        input.cmyk,
      },
      outputs = {
        output.hex,
        output.hex_short,
        output.css_rgb,
        output.css_hsl,
        output.css_oklch,
      },
      -- :CccPick detects the color format under the cursor and keeps it
      recognize = {
        input = true,
        output = true,
      },
    })
  end,
}

return opts
