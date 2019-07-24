----------------------------------------------------------------------
-- Creates a new file with the selected preset
----------------------------------------------------------------------

local canvasPresets = {
	{96, 96}, -- these values are presets for x and y, you can add all you want here in this format
	{214, 120},
	{240, 135}
}


local dlg = Dialog("Canvas Presets")
for i, canvasPreset in ipairs(canvasPresets) do
	dlg:radio{ id="radioPreset"..i,
		text=canvasPreset[1].."x"..canvasPreset[2],
		selected=false,
		onclick=function() 
			app.command.NewFile {
				ui=true,
				width=canvasPreset[1],
				height=canvasPreset[2],
				colorMode=ColorMode.RGB,
				fromClipboard=false
			}
		end
	}
end
dlg:show{wait=false}
return dlg