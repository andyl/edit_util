-- key/init
-- keymaps and "WhichKey" configuartion

require "user.key.conf"
require "user.key.map_base"

if not WhichKeyOk then return end -- remaining maps are registered via which-key

require "user.key.map_bracket"
require "user.key.map_leader"
require "user.key.map_slash"
require "user.key.map_dash"
require "user.key.map_a"
require "user.key.map_g"
require "user.key.map_z"

