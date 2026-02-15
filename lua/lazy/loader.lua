local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lt, lpath = {}, "~/.config/nvim/lua/lazy"
local ppath, spath = lpath.."/plugins", lpath.."/setups"

local handle = vim.loop.fs_scandir(ppath)
while true do
	local name, type = vim.loop.fs_scandir_next(handle)
	if not name then break end
	if type == "file" and name:match("%.lua$") then
		local file_path = ppath .. "/" .. name
		local spec = dofile(file_path)
		lt[spec[1]] = spec
	end
end

for _,plg in next,require("lazy.others") do 
	if not(lt[plg[1]]) then 
		lt[plg[1]] = plg
	else
	end
end
local ltt = {}
for i,v in next,lt do ltt[#ltt+1] = v end
local lazy = require("lazy")
lazy.setup(ltt)

require("lazy.setups")
