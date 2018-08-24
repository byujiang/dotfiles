---- check if file exists
local lfs = require 'lfs'

function is_exists(file)
	local f = io.open(file, "rb")
	if f then f:close() end
	return f ~= nil
end

function lines_from(file)
	if not is_exists(file) then
		print(file.." not exist!!!!")
		return {}
	end
	lines = {}
	for line in io.lines(file) do
		lines[#lines +1] = line
		print(line)
	end
	return lines
end

-- local file = "~/Dropbox/Workspace/todo/conky.txt"
local file = "todo.txt"
local lines = lines_from(file)
todo = ""

for i = 1, #lines do
	todo = todo .. " ${color cyan}\t${offset 10} -  "..tostring(i)..".     ".. lines[i] .. "\n"
end

function conky_todo()
	return todo
end

