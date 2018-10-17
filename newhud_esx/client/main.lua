-- Pause menu disable hud display
local isPaused = false

AddEventHandler('danizinha:setDisplay', function(val)

    SendNUIMessage({
        setDisplay = true,
        display    = val
    })

end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(10)
    if IsPauseMenuActive() and not isPaused then
      isPaused = true
         TriggerEvent('danizinha:setDisplay', 0.0)
    elseif not IsPauseMenuActive() and isPaused then
      isPaused = false 
         TriggerEvent('danizinha:setDisplay', 1)
    end
  end
end)

Citizen.CreateThread(function()
  while true do 
      Citizen.Wait(1)
      
      drawRct(0.2444, 0.807900, 0.070,0.0439, 21, 21, 21,255)
      drawRct(0.2444, 0.852000, 0.070,0.045, 21, 21, 21,255)
      local health = GetEntityHealth(GetPlayerPed(-1)) - 100
      local varSetVida = 0.07 * (health / 100)
      drawRct(0.2444, 0.807900, varSetVida,0.0439,55,115,55,255)
      armor = GetPedArmour(GetPlayerPed(-1)) 
      if armor > 100.0 then armor = 100.0 end
      local varSetColete = 0.07 * (armor / 100)
      drawRct(0.2444, 0.852000, varSetColete, 0.045, 114, 20, 255, 255)
  end
end)


function drawRct(x,y,width,height,r,g,b,a)
  DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end