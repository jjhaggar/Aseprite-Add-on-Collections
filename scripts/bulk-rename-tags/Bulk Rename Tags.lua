
------------------------------------------------------------------------------------
-- BULK RENAME TAGS for Aseprite (https://aseprite.org)
------------------------------------------------------------------------------------

-- Version 1.0 (2020-02-11)
-- Version 1.1 (2020-02-15)
-- Version 1.2 (2020-02-15)

-- Contributors: Arkogelul, Dacap, JJHaggar

------------------------------------------------------------------------------------

-- LICENSE:
--
-- This is free and unencumbered software released into the public domain.
-- 
-- Anyone is free to copy, modify, publish, use, compile, sell, or
-- distribute this software, either in source code form or as a compiled
-- binary, for any purpose, commercial or non-commercial, and by any
-- means.
-- 
-- In jurisdictions that recognize copyright laws, the author or authors
-- of this software dedicate any and all copyright interest in the
-- software to the public domain. We make this dedication for the benefit
-- of the public at large and to the detriment of our heirs and
-- successors. We intend this dedication to be an overt act of
-- relinquishment in perpetuity of all present and future rights to this
-- software under copyright law.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
-- OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
-- ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-- OTHER DEALINGS IN THE SOFTWARE.
-- 
-- For more information, please refer to <http://unlicense.org/>

------------------------------------------------------------------------------------

local original_string = "Original String"
local new_string = "New String"
local added_to_start_string = ""
local added_to_end_string = ""

function RenameTagsActiveSpriteOnly()
	local sprite = app.activeSprite
	for i, tag in ipairs(sprite.tags) do
		local name = tag.name
		if (string.find(name, original_string)) == nil then 
			tag.name = added_to_start_string .. name .. added_to_end_string
		else 
			tag.name = added_to_start_string .. (string.gsub(name, original_string, new_string)) .. added_to_end_string
		end
	end
end

function RenameTagsAllOpenSprites()
	for i,sprite in ipairs(app.sprites) do
		for i, tag in ipairs(sprite.tags) do
			local name = tag.name
			if (string.find(name, original_string)) == nil then 
				tag.name = added_to_start_string .. name .. added_to_end_string
			else 
				tag.name = added_to_start_string .. (string.gsub(name, original_string, new_string)) .. added_to_end_string
			end
		end
	end
end

------------------------------------------------------------------------------------
-- USER INTERFACE --
------------------------------------------------------------------------------------

local dlg = Dialog("Bulk Rename Tags (v1.2)")

dlg:separator{ id="separator1", text="Replace strings"} 

dlg:entry{ id="original_string",
           label="Find this text in tags:",
           text=original_string,
           focus = true }

dlg:entry{ id="new_string",
           label="Replace that text with:",
           text=new_string,
           focus = false }

dlg:separator{ id="separator2", text="Add strings"} 

dlg:entry{ id="added_to_start_string",
           label="Add to the start of tags:",
           text=added_to_start_string,
           focus = false }

dlg:entry{ id="added_to_end_string",
           label="Add to the end of tags:",
           text=added_to_end_string,
           focus = false }

dlg:separator{ id="separator3", text=""} 

dlg:button{ label="Change strings in:", text="Active Sprite",onclick=function() 
		local data = dlg.data
		original_string = data.original_string
		new_string = data.new_string
		added_to_start_string = data.added_to_start_string
		added_to_end_string = data.added_to_end_string
		RenameTagsActiveSpriteOnly()
		--Refresh screen
		app.command.Undo()
		app.command.Redo()
	end 
}		   

dlg:button{ text="All Open Sprites",onclick=function() 
		local data = dlg.data
		original_string = data.original_string
		new_string = data.new_string
		added_to_start_string = data.added_to_start_string
		added_to_end_string = data.added_to_end_string
		RenameTagsAllOpenSprites()
		--Refresh screen
		app.command.Undo()
		app.command.Redo()
	end 
}		   

dlg:show{wait=false}

return dlg