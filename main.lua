require "utils"

function love.load()
  state = "idle"
  rectangles = {}
  activeRectangle=nil
end

function love.update(dt)
  mousePos = vectorO:new(love.mouse.getX(), love.mouse.getY())
  if not activeRectangle == nil then
    activeRectangle:update()
  end
  if #rectangles>0 then
    for i=1, #rectangles do
      rectangles[i]:update()
    end
  end
end

function love.mousepressed(x,y,btn)
  if btn==1 then
    if state == "idle" then
      activeRectangle = rectangleO:new(x,y,0,0)
      state = "drawing"
    else
      activeRectangle:setPassive()
      state = "idle"
      activeRectangle = nil
    end
  end
end

function love.draw()
  debug()
  if not activeRectangle == nil then
    activeRectangle:draw()
  end
  if #rectangles>0 then
    for i=1, #rectangles do
      rectangles[i]:draw()
    end
  end
end

function love.keypressed(btn, isRepeat)
  if btn == "escape" then
    love.event.quit()
  end
  if btn == "return" then
    love.filesystem.append("test", "bie")
  end
end
