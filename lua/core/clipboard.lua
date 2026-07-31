local M = {}

local function snapshot(register)
	return vim.fn.getreginfo(register)
end

local function restore(register, value)
	vim.fn.setreg(register, value)
end

local function preserve_internal_yanks(action)
	local unnamed = snapshot('"')
	local yank = snapshot("0")
	local unnamed_target = unnamed.points_to
	local unnamed_target_value = snapshot(unnamed_target)
	local ok, err = xpcall(action, debug.traceback)

	restore("0", yank)
	if unnamed_target == "+" or unnamed_target == "*" then
		-- Detach the unnamed register from the clipboard so the new clipboard
		-- value can coexist with Neovim's most recent internal yank.
		yank.isunnamed = true
		restore("0", yank)
	else
		unnamed_target_value.isunnamed = true
		restore(unnamed_target, unnamed_target_value)
	end

	if not ok then
		error(err)
	end
end

function M.operator(type)
	preserve_internal_yanks(function()
		local selection
		if type == "line" then
			selection = "'[V']"
		elseif type == "block" then
			selection = "`[\22`]"
		else
			selection = "`[v`]"
		end
		vim.cmd.normal({ args = { selection .. '"+y' }, bang = true })
	end)
end

function M.start_operator()
	vim.go.operatorfunc = "v:lua.require'core.clipboard'.operator"
	return "g@"
end

function M.visual()
	preserve_internal_yanks(function()
		vim.cmd.normal({ args = { '"+y' }, bang = true })
	end)
end

function M.line()
	preserve_internal_yanks(function()
		vim.cmd.normal({ args = { '"+yy' }, bang = true })
	end)
end

return M
