require "config.settings"
require "config.lazy"
require "config.keymaps"
require "config.utils"

local home = os.getenv("HOME")
vim.opt.rtp:append(home .. "/web/personal/tools")
package.path = package.path .. ";" .. home .. "/web/personal/tools/?.lua"
require("tools").setup()
