local Lib = require "auto-session.session-lens.library"
local Actions = require "auto-session.session-lens.actions"

local logger = require("auto-session.logger"):new {
  log_level = vim.log.levels.INFO,
}

----------- Setup ----------
local SessionLens = {
  conf = {},
}

---Session Lens Config
---@class session_lens_config
---@field shorten_path boolean
---@field theme_conf table
---@field buftypes_to_ignore table
---@field previewer boolean
---@field session_control session_control
---@field load_on_setup boolean

---@type session_lens_config
local defaultConf = {
  theme_conf = { winblend = 10, border = true },
  previewer = false,
  buftypes_to_ignore = {},
}

-- Set default config on plugin load
SessionLens.conf = defaultConf

function SessionLens.setup(auto_session)
  SessionLens.conf = vim.tbl_deep_extend("force", SessionLens.conf, auto_session.conf.session_lens)
  SessionLens.conf.functions = auto_session

  Lib.setup(SessionLens.conf, auto_session)
  Actions.setup(SessionLens.conf, auto_session)
  logger.log_level = auto_session.conf.log_level
end

---Search session
---Triggers the customized telescope picker for switching sessions
---@param custom_opts any
SessionLens.search_session = function(custom_opts)
end

return SessionLens
