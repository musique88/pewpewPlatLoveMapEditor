require "utils"

function love.load()
  state = "idle"
end

function love.update(dt)
  mousePos = vectorO:new(love.mouse.getX(), love.mouse.getY())
  
end

function love.draw()
  debug()
end

function love.mousePressed(btn)
  if btn == 1 then
    if state == "idle" then

    elseif state == "drawing" then

    end
  end
end

function love.keypressed(btn, isRepeat)
  if btn == "escape" then
    love.event.quit()
  end
end
