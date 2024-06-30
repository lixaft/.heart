local theme = require("theme")
local colors = theme.colors

local M = {}

---@param color string
---@return number[]
local function hex_to_rgb(color)
  local num = tonumber(color:sub(2, 7), 16)
  return {
    bit.rshift(num, 16),
    bit.band(bit.rshift(num, 8), 0xFF),
    bit.band(num, 0xFF),
  }
end

---@param b string
---@param a string
---@param alpha number?
---@return string
function M.blend(a, b, alpha)
  if alpha == nil then
    alpha = 0.5
  elseif alpha == 0 then
    return a
  elseif alpha == 1 then
    return b
  end

  local a_rgb = hex_to_rgb(a)
  local b_rgb = hex_to_rgb(b)

  local blender = function(i)
    return b_rgb[i] * alpha + (1 - alpha) * a_rgb[i]
  end

  return string.format("#%02x%02x%02x", blender(1), blender(2), blender(3))
end

---@param color string
---@param amount number?
---@param bg string?
---@return string
function M.darken(color, amount, bg)
  return M.blend(color, bg or colors.bg, amount)
end

---@param color string
---@param amount number?
---@param bg string?
---@return string
function M.lighten(color, amount, fg)
  return M.blend(color, fg or "#ffffff", amount)
end

return M
