
---------------------------------------
-- EXTERNAL LIBRARIES --
---------------------------------------
 dofile("./easing.lua")



---------------------------------------
-- INTERPOLATION LOGIC --
---------------------------------------

local function createFrames(totalFrames)
  local startingFrames = 1 -- this should be read directly from the sprite
  local newFrames = totalFrames-startingFrames

  for i=startingFrames, newFrames do 
	app.command.NewFrame()
  end
end

local function createAnimationMovementX(totalFrames, distancePix, easingChoiceForX, waveAmplitude, wavePeriod, sGotNoIdea)

  -- Default values for the (optional) last 3 parameters
  waveAmplitude = waveAmplitude or 5
  wavePeriod = wavePeriod or 4
  sGotNoIdea = sGotNoIdea or 1.70158 -- I don't know what this default value means

  local startingFrames = 1 -- TO-DO: this should be read directly from the sprite
  local newFrames = totalFrames-startingFrames
  local durationFrames = newFrames
  local startingPosPix = 0 -- TO-DO: Use it or delete it? this one is probably unnecesary

  local sprite = app.activeSprite

  for i, layer in ipairs(sprite.layers) do  -- TODO: Maybe this shouldn't go over all the layers, maybe only over the active one
    for j, cel in ipairs(layer.cels) do

	  local xIncrement = 0

	  if easingChoiceForX == "linear" then xIncrement = linear(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForX == "inQuad" then xIncrement = inQuad(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outQuad" then xIncrement = outQuad(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "inOutQuad" then xIncrement = inOutQuad(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outInQuad" then xIncrement = outInQuad(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForX == "inCubic" then xIncrement = inCubic(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outCubic" then xIncrement = outCubic(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "inOutCubic" then xIncrement = inOutCubic(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outInCubic" then xIncrement = outInCubic(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForX == "inQuart" then xIncrement = inQuart(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outQuart" then xIncrement = outQuart(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "inOutQuart" then xIncrement = inOutQuart(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outInQuart" then xIncrement = outInQuart(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForX == "inQuint" then xIncrement = inQuint(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outQuint" then xIncrement = outQuint(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "inOutQuint" then xIncrement = inOutQuint(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outInQuint" then xIncrement = outInQuint(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForX == "inSine" then xIncrement = inSine(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outSine" then xIncrement = outSine(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "inOutSine" then xIncrement = inOutSine(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outInSine" then xIncrement = outInSine(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForX == "inExpo" then xIncrement = inExpo(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outExpo" then xIncrement = outExpo(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "inOutExpo" then xIncrement = inOutExpo(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outInExpo" then xIncrement = outInExpo(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForX == "inCirc" then xIncrement = inCirc(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outCirc" then xIncrement = outCirc(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "inOutCirc" then xIncrement = inOutCirc(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outInCirc" then xIncrement = outInCirc(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForX == "inElastic" then xIncrement = inElastic(j-1, startingPosPix, distancePix, durationFrames, waveAmplitude, wavePeriod)
	  elseif easingChoiceForX == "outElastic" then xIncrement = outElastic(j-1, startingPosPix, distancePix, durationFrames, waveAmplitude, wavePeriod)
	  elseif easingChoiceForX == "inOutElastic" then xIncrement = inOutElastic(j-1, startingPosPix, distancePix, durationFrames, waveAmplitude, wavePeriod)
	  elseif easingChoiceForX == "outInElastic" then xIncrement = outInElastic(j-1, startingPosPix, distancePix, durationFrames, waveAmplitude, wavePeriod)
	  
	  elseif easingChoiceForX == "inBack" then xIncrement = inBack(j-1, startingPosPix, distancePix, durationFrames, sGotNoIdea) --what the hell is sGotNoIdea ??
	  elseif easingChoiceForX == "outBack" then xIncrement = outBack(j-1, startingPosPix, distancePix, durationFrames, sGotNoIdea)
	  elseif easingChoiceForX == "inOutBack" then xIncrement = inOutBack(j-1, startingPosPix, distancePix, durationFrames, sGotNoIdea)
	  elseif easingChoiceForX == "outInBack" then xIncrement = outInBack(j-1, startingPosPix, distancePix, durationFrames, sGotNoIdea)
	  
	  elseif easingChoiceForX == "inBounce" then xIncrement = inBounce(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outBounce" then xIncrement = outBounce(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "inOutBounce" then xIncrement = inOutBounce(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForX == "outInBounce" then xIncrement = outInBounce(j-1, startingPosPix, distancePix, durationFrames)

	  else print("ERROR!!!!! EasingChoice for X Unknown!!")
	  end 

	  cel.position = { x = cel.position.x + xIncrement, y = cel.position.y }
    end
  end
  -- refresh screen
  app.command.Undo()
  app.command.Redo()  
end
  
  local function createAnimationMovementY(totalFrames, distancePix, easingChoiceForY, waveAmplitude, wavePeriod, sGotNoIdea)

  -- Default values for the last 3 parameters
  waveAmplitude = waveAmplitude or 5
  wavePeriod = wavePeriod or 4
  sGotNoIdea = sGotNoIdea or 1.70158

  local startingFrames = 1 -- TODO:  this should be read directly from the sprite
  local newFrames = totalFrames-startingFrames
  local durationFrames = newFrames
  local startingPosPix = 0 -- TODO:  this one is probably unnecesary?

  local sprite = app.activeSprite

  for i, layer in ipairs(sprite.layers) do  -- TODO: Maybe this shouldn't go over all the layers, maybe only over the active one
    for j, cel in ipairs(layer.cels) do

	  local yIncrement = 0

	  if easingChoiceForY == "linear" then yIncrement = linear(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForY == "inQuad" then yIncrement = inQuad(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outQuad" then yIncrement = outQuad(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "inOutQuad" then yIncrement = inOutQuad(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outInQuad" then yIncrement = outInQuad(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForY == "inCubic" then yIncrement = inCubic(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outCubic" then yIncrement = outCubic(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "inOutCubic" then yIncrement = inOutCubic(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outInCubic" then yIncrement = outInCubic(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForY == "inQuart" then yIncrement = inQuart(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outQuart" then yIncrement = outQuart(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "inOutQuart" then yIncrement = inOutQuart(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outInQuart" then yIncrement = outInQuart(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForY == "inQuint" then yIncrement = inQuint(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outQuint" then yIncrement = outQuint(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "inOutQuint" then yIncrement = inOutQuint(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outInQuint" then yIncrement = outInQuint(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForY == "inSine" then yIncrement = inSine(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outSine" then yIncrement = outSine(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "inOutSine" then yIncrement = inOutSine(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outInSine" then yIncrement = outInSine(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForY == "inExpo" then yIncrement = inExpo(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outExpo" then yIncrement = outExpo(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "inOutExpo" then yIncrement = inOutExpo(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outInExpo" then yIncrement = outInExpo(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForY == "inCirc" then yIncrement = inCirc(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outCirc" then yIncrement = outCirc(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "inOutCirc" then yIncrement = inOutCirc(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outInCirc" then yIncrement = outInCirc(j-1, startingPosPix, distancePix, durationFrames)
	  
	  elseif easingChoiceForY == "inElastic" then yIncrement = inElastic(j-1, startingPosPix, distancePix, durationFrames, waveAmplitude, wavePeriod)
	  elseif easingChoiceForY == "outElastic" then yIncrement = outElastic(j-1, startingPosPix, distancePix, durationFrames, waveAmplitude, wavePeriod)
	  elseif easingChoiceForY == "inOutElastic" then yIncrement = inOutElastic(j-1, startingPosPix, distancePix, durationFrames, waveAmplitude, wavePeriod)
	  elseif easingChoiceForY == "outInElastic" then yIncrement = outInElastic(j-1, startingPosPix, distancePix, durationFrames, waveAmplitude, wavePeriod)
	  
	  elseif easingChoiceForY == "inBack" then yIncrement = inBack(j-1, startingPosPix, distancePix, durationFrames, sGotNoIdea) --what the hell is sGotNoIdea ??
	  elseif easingChoiceForY == "outBack" then yIncrement = outBack(j-1, startingPosPix, distancePix, durationFrames, sGotNoIdea)
	  elseif easingChoiceForY == "inOutBack" then yIncrement = inOutBack(j-1, startingPosPix, distancePix, durationFrames, sGotNoIdea)
	  elseif easingChoiceForY == "outInBack" then yIncrement = outInBack(j-1, startingPosPix, distancePix, durationFrames, sGotNoIdea)
	  
	  elseif easingChoiceForY == "inBounce" then yIncrement = inBounce(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outBounce" then yIncrement = outBounce(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "inOutBounce" then yIncrement = inOutBounce(j-1, startingPosPix, distancePix, durationFrames)
	  elseif easingChoiceForY == "outInBounce" then yIncrement = outInBounce(j-1, startingPosPix, distancePix, durationFrames)

	  else print("ERROR!!!!! EasingChoice for Y Unknown!!")
	  end 

	  cel.position = { x = cel.position.x, y = cel.position.y + yIncrement }
    end
  end
  --Refresh screen
  --app.refresh()
  app.command.Undo()
  app.command.Redo()
end



---------------------------------------
-- USER INTERFACE --
---------------------------------------

local dlg = Dialog("Easing Animations (Movement)")
dlg
:separator{ id="separatorMoveX", text="Horizontal Movement" } -------------------------------------------------------------------------------
:combobox{ id="comboboxHorizEasingEasing",
              label="Easing",
              -- option="Easing",
              options={ "None(Linear)","in","out", "inOut", "outIn"} -- To access the selected option value use: dlg.data.comboboxHorizEasingEasing (comboboxEasingWhere is the id)
}
:combobox{ id="comboboxHorizEasingType",
              label="Type",
              -- option="Type",
              options={ "Sine","Quad","Cubic", "Quart", "Quint", "Expo", "Back", "Elastic", "Bounce"}
}
:number{ id="numberMovingInX", label="Move(pix)", text="10", decimals=0 }
:radio{id="radioLeftRight1", label="Move to the ",text="Left"}
:radio{id="radioLeftRight2",text="Right", selected=true}

-- :separator() -------------------------------------------------------------------------------------
:separator{ id="separatorMoveY", text="Vertical Movement" } -------------------------------------------------------------------------------
:combobox{ id="comboboxVertEasingEasing",
              label="Easing", options={ "None(Linear)","in","out", "inOut", "outIn"} }
:combobox{ id="comboboxVertEasingType", label="Type", options={ "Sine","Quad","Cubic", "Quart", "Quint", "Expo", "Back", "Elastic", "Bounce"} }
:number{ id="numberMovingInY", label="Move(pix)", text="10", decimals=0 }
:radio{id="radioUpDown1", label="Move ",text="Up"}
:radio{id="radioUpDown2",text="Down", selected=true}


-- :separator() -------------------------------------------------------------------------------------
:separator{ id="separatorAnimation", text="Animation" } -------------------------------------------------------------------------------
:slider{ id="sliderAnimationFrames", label="Total Frames", min=2, max=100, value=11 }
:button{ id="buttonCreateFrames", label="Create", text="Frames", selected=false, focus=false,
            onclick=function()
			  createFrames(dlg.data.sliderAnimationFrames)
			end
}
:button{ id="buttonCreateAnimation", text="Animation", selected=false, focus=false,
            onclick=function()

			  local numFrames = dlg.data.sliderAnimationFrames

			  local senseOfDirectionX = 1
              if dlg.data.radioLeftRight1 then
                senseOfDirectionX = -1
              end
			  local senseOfDirectionY = 1
              if dlg.data.radioUpDown1 then
                senseOfDirectionY = -1
              end

			  local movHorPix = dlg.data.numberMovingInX * senseOfDirectionX -- or 0
			  local easingHor = "linear"
			  if dlg.data.comboboxHorizEasingEasing ~= "None(Linear)" then
			    easingHor = dlg.data.comboboxHorizEasingEasing .. dlg.data.comboboxHorizEasingType
			  end
			  -- print("numFrames=" .. numFrames .. " movHorPix=" .. movHorPix .. " easingHor=" .. easingHor)
			  createAnimationMovementX(numFrames, movHorPix, easingHor)--, waveAmplitude, wavePeriod, sGotNoIdea)
			  
			  local movVerPix = dlg.data.numberMovingInY * senseOfDirectionY -- or 0
			  local easingVer = "linear"
			  if dlg.data.comboboxVertEasingEasing ~= "None(Linear)" then
			    easingVer = dlg.data.comboboxVertEasingEasing .. dlg.data.comboboxVertEasingType
			  end
			  -- print("numFrames=" .. numFrames .. " movHorPix=" .. movHorPix .. " easingHor=" .. easingHor)
			  createAnimationMovementY(numFrames, movVerPix, easingVer)--, waveAmplitude, wavePeriod, sGotNoIdea)
			  
			end
}
:button{ id="buttonCreateFramesAndAnimation", label="", text="Frames && Animation", selected=false, focus=false,
            onclick=function()
			  local numFrames = dlg.data.sliderAnimationFrames
			  createFrames(numFrames)

			  local senseOfDirectionX = 1
              if dlg.data.radioLeftRight1 then
                senseOfDirectionX = -1
              end
			  local senseOfDirectionY = 1
              if dlg.data.radioUpDown1 then
                senseOfDirectionY = -1
              end

			  local movHorPix = dlg.data.numberMovingInX * senseOfDirectionX
			  local easingHor = "linear"
			  if dlg.data.comboboxHorizEasingEasing ~= "None(Linear)" then
			    easingHor = dlg.data.comboboxHorizEasingEasing .. dlg.data.comboboxHorizEasingType
			  end
			  createAnimationMovementX(numFrames, movHorPix, easingHor)--, waveAmplitude, wavePeriod, sGotNoIdea)
			  local movVerPix = dlg.data.numberMovingInY * senseOfDirectionY
			  local easingVer = "linear"
			  if dlg.data.comboboxVertEasingEasing ~= "None(Linear)" then
			    easingVer = dlg.data.comboboxVertEasingEasing .. dlg.data.comboboxVertEasingType
			  end
			  createAnimationMovementY(numFrames, movVerPix, easingVer)--, waveAmplitude, wavePeriod, sGotNoIdea)
			end
}

:show{wait=false}
