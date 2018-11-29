require "utils"

function love.load()
  love.window.setMode(1280,720)
  state = "idle"
  rectangles = {rectangleO:newPassive(-1000,-1000,1010,2280,"normal"),
                rectangleO:newPassive(0,710,1280,1010,"normal"),
                rectangleO:newPassive(1270,-1000,1010,2280,"normal")}
  activeRectangle=nil
  rAmt=50
  love.filesystem.write("map", "")
  activeType="normal"
end

function love.update(dt)
  mousePos = vectorO:new(love.mouse.getX(), love.mouse.getY())
  if activeRectangle ~= nil then
    activeRectangle:update()
  end
  if #rectangles>0 then
    if rectangles[i] ~= nil then
      for i=1, #rectangles do
        rectangles[i]:update()
      end
    end
  end
end

function love.mousepressed(x,y,btn)
  if btn==1 then
    if state == "idle" then
      activeRectangle = rectangleO:new(x,y,0,0,activeType)
      state = "drawing"
    else
      activeRectangle:setPassive()
      state = "idle"
      activeRectangle = nil
    end
  end
end

function love.draw()
  if activeRectangle ~= nil then
    activeRectangle:draw()
  end
  if #rectangles>0 then
    for i=1, #rectangles do
      if rectangles[i] ~= nil then
        rectangles[i]:draw()
      end
    end
  end
  debug()
end

function love.keypressed(btn,scanCode,isRepeat)
  if btn == "escape" then
    love.event.quit()
  end
  if btn == "return" then
    for i=1, #rectangles do
      love.filesystem.append("map", "rectangleO:new("..
      rectangles[i].x..","..
      rectangles[i].y..","..
      rectangles[i].w..","..
      rectangles[i].h..",\""..
      rectangles[i].type.."\")\n")
    end
  end
  if btn =="f" then
    if state == "idle" then
      activeRectangle = rectangleO:new(mousePos.x,mousePos.y,0,0,activeType)
      state = "drawing"
    else
      activeRectangle:setPassive()
      state = "idle"
      activeRectangle = nil
    end
  end
  if btn == "1" then
    activeType = "normal"
  elseif btn == "2" then
    activeType = "bouncing"
  end
  if btn == "x" then
    love.load()
  end
  if btn == "z" then
    if #rectangles > 3 then
      rectangles[#rectangles] = nil
    end
  end
  --moving mouseCursor
  if btn == "up" and love.keyboard.isDown("w") then
    love.mouse.setY(mousePos.y-10)
  elseif btn == "down" and love.keyboard.isDown("w") then
    love.mouse.setY(mousePos.y+10)
  elseif btn == "left" and love.keyboard.isDown("w") then
    love.mouse.setX(mousePos.x-10)
  elseif btn == "right" and love.keyboard.isDown("w") then
    love.mouse.setX(mousePos.x+10)
  elseif btn == "up" and love.keyboard.isDown("e") then
    love.mouse.setY(mousePos.y-100)
  elseif btn == "down" and love.keyboard.isDown("e") then
    love.mouse.setY(mousePos.y+100)
  elseif btn == "left" and love.keyboard.isDown("e") then
    love.mouse.setX(mousePos.x-100)
  elseif btn == "right" and love.keyboard.isDown("e") then
    love.mouse.setX(mousePos.x+100)
  elseif btn == "up" and love.keyboard.isDown("r") then
    love.mouse.setY(mousePos.y-rAmt)
  elseif btn == "down" and love.keyboard.isDown("r") then
    love.mouse.setY(mousePos.y+rAmt)
  elseif btn == "left" and love.keyboard.isDown("r") then
    love.mouse.setX(mousePos.x-rAmt)
  elseif btn == "right" and love.keyboard.isDown("r") then
    love.mouse.setX(mousePos.x+rAmt)
  elseif btn == "up" then
    love.mouse.setY(mousePos.y-1)
  elseif btn == "down" then
    love.mouse.setY(mousePos.y+1)
  elseif btn == "left" then
    love.mouse.setX(mousePos.x-1)
  elseif btn == "right" then
    love.mouse.setX(mousePos.x+1)
  end
end
