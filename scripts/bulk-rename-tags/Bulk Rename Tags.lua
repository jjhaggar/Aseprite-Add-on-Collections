
------------------------------------------------------------------------------------
-- BULK RENAME TAGS for Aseprite (https://aseprite.org)
------------------------------------------------------------------------------------

-- Version 1.0 (2020-02-11)
-- Version 1.1 (2020-02-15)

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

function RenameTagsActiveSpriteOnly()
	local sprite = app.activeSprite

	for i, tag in ipairs(sprite.tags) do

		local name = tag.name
		tag.name = (string.gsub(name, original_string, new_string))

	end
end

function RenameTagsAllOpenSprites()
	for i,sprite in ipairs(app.sprites) do

		for i, tag in ipairs(sprite.tags) do

			local name = tag.name
			tag.name = (string.gsub(name, original_string, new_string))
		end
	end
end


------------------------------------------------------------------------------------
-- USER INTERFACE --
------------------------------------------------------------------------------------

local dlg = Dialog("Bulk Rename Tags (v1.1)")

dlg:entry{ id="original_string",
           label="Find this text in tags:",
           text=original_string,
           focus = true }

dlg:entry{ id="new_string",
           label="Replace that text with:",
           text=new_string,
           focus = false }

dlg:separator{ id="separator", text=""} 

dlg:button{ label="Replace in:", text="Active Sprite",onclick=function() 
		local data = dlg.data
		original_string = data.original_string
		new_string = data.new_string
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
		RenameTagsAllOpenSprites()
		--Refresh screen
		app.command.Undo()
		app.command.Redo()
	end 
}		   

dlg:show{wait=false}

return dlg
