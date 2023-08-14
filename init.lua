-- mod-version:3
local core = require "core"
local command = require "core.command"

-- where (relative to view height) should be current line scrolled to
local target = 0.3

local function scrolltotarget(dv)
  local targety = math.floor(dv.size.y * target)
  local line = dv.doc:get_selection(false)
  local _, y = dv:get_line_screen_position(line)
  local ydiff = y - targety
  dv.scroll.to.y = dv.scroll.y + ydiff
end

command.add("core.docview!", {
  ["doc:scroll-to-target"] = scrolltotarget,
})

return {
  scrolltotarget = scrolltotarget,
  target = target,
}

